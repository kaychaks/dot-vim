-- fzf locations would change for linux and mac
local function fzf_by_os()
	local os = vim.loop.os_uname().sysname

	if string.lower(os) == "linux" then
		return "~/.nix-profile/share/vim-plugins/fzf"
	elseif string.lower(os) == "darwin" then
		return "/usr/local/Cellar/fzf/0.35.1"
	else
		return ""
	end
end

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	-- lsp
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
			require("lang/setup")
		end,
	})

	use("simrat39/rust-tools.nvim")

	use("LnL7/vim-nix")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("ui/plugins_setup/null-ls")
		end,
	})

	-- completion
	use({
		"onsails/lspkind-nvim",
		config = function()
			require("ui/plugins_setup/lspkind")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("ui/plugins_setup/cmp")

			vim.cmd([[
				set completeopt=menuone,noinsert,noselect
				highlight! default link CmpItemKind CmpItemMenuDefault
			]])
		end,
	})

	use("hrsh7th/cmp-nvim-lsp-signature-help", {
		after = "nvim-cmp",
	})

	use("hrsh7th/cmp-nvim-lsp-document-symbol", {
		after = "nvim-cmp",
	})

	use({
		"saecki/crates.nvim",
		tag = "v0.2.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
		after = "nvim-cmp",
	})

	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		after = "nvim-cmp",
	})

	-- lsp uis
	use({
		"glepnir/lspsaga.nvim",
		config = function()
			local saga = require("lspsaga")
			local Lib = require("lib")

			saga.init_lsp_saga({
				server_filetype_map = {
					typescript = "typescript",
				},
			})

			Lib.nnoremap({
				["K"] = "<Cmd>Lspsaga hover_doc<CR>",
				["gd"] = "<Cmd>Lspsaga lsp_finder<CR>",
				["<C-j>"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
				["gp"] = "<Cmd>Lspsaga peek_definition<CR>",
				["gr"] = "<Cmd>Lspsaga rename<CR>",
				["<Leader>ca"] = "<Cmd>Lspsaga code_action<CR>",
				["<Leader>@"] = "<Cmd>LSoutlineToggle<CR>",
				["<Leader>gg"] = "<cmd>Lspsaga open_floaterm lazygit<CR>",
			})

			Lib.tnoremap({
				["<C-t>"] = [[<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>]],
			})
		end,
	})

	-- diagnostics
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
			require("lang/diagnostics")
		end,
	})

	-- color scheme
	use("RRethy/nvim-base16")

	-- UI

	-- sorround
	use("tpope/vim-surround")

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "vim" },
			})
		end,
	})

	--ts-autotag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	})

	-- tabs & buffers
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("ui/plugins_setup/bufferline")
		end,
	})

	use("famiu/bufdelete.nvim")

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- filetree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("ui/plugins_setup/nvim-tree")
		end,
	})

	-- indentation guide
	use("lukas-reineke/indent-blankline.nvim")

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("ui/plugins_setup/lualine")
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("ui/plugins_setup/nvim-treesitter")
		end,
	})

	-- git
	use("tpope/vim-fugitive")
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })

	-- lsp
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- snippets
	use("L3MON4D3/LuaSnip")

	-- completion

	use({
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = "symbol",
				symbol_map = {
					Array = "",
					Boolean = "⊨",
					Class = "",
					Constructor = "",
					Key = "",
					Namespace = "",
					Null = "NULL",
					Number = "#",
					Object = "⦿",
					Package = "",
					Property = "",
					Reference = "",
					Snippet = "",
					String = "𝓐",
					TypeParameter = "",
					Unit = "",
				},
			})
		end,
	})

	-- fuzzy finder
	use("airblade/vim-rooter")

	use({ fzf_by_os() })

	use("junegunn/fzf.vim")
end)
