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
		requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
			require("lang/setup")
		end,
	})

	-- rust specific lsp configs
	use("simrat39/rust-tools.nvim")

	-- typescript specific lsp configs
	use({
		"jose-elias-alvarez/typescript.nvim",
		requires = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local Util = require("lang/util")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("typescript").setup({
				server = {
					on_attach = Util.on_attach,
					filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
					cmd = { "typescript-language-server", "--stdio" },
					capabilities = capabilities,
				},
			})
		end,
	})

	-- nix
	use("LnL7/vim-nix")

	-- formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"jose-elias-alvarez/typescript.nvim",
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
			require("lang/plugins_setup/lspsaga")
		end,
	})

	-- language bindings without lsp
	use({
		"sheerun/vim-polyglot",
		config = function()
			-- vim.go.polyglot_disabled = [ 'sensible' ]
		end,
	})

	-- diagnostics
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
			require("lang/diagnostics")
		end,
	})

	-- color scheme
	use({
		"RRethy/nvim-base16",
		config = function()
			require("ui/plugins_setup/base16")
		end,
	})

	-- UI

	-- commenting
	use("tpope/vim-commentary")

	-- sorround
	use("tpope/vim-surround")

	-- all magic with [ adn ]
	use("tpope/vim-unimpaired")

	-- better repeat
	use("tpope/vim-repeat")

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("ui/plugins_setup/autopairs")
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
		tag = "v3.*",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("ui/plugins_setup/bufferline")
		end,
	})

	use("famiu/bufdelete.nvim")

	-- buffers belongs to tabs
	use({
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("ui/plugins_setup/colorizer")
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

	-- broot, a better terminal file manager
	use({ "lstwn/broot.vim", config = function() end })

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
	-- fugitive for github
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })
	-- git blame
	use({
		"dinhhuy258/git.nvim",
		config = function()
			require("ui/plugins_setup/git")
		end,
	})

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
			require("ui/plugins_setup/lspkind")
		end,
	})

	-- fuzzy finder
	use("airblade/vim-rooter")

	use("nvim-telescope/telescope-ui-select.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("ui/plugins_setup/telescope")
		end,
	})

	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("ui/plugins_setup/toggleterm")
		end,
	})

	-- auto save
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({})
		end,
	})

	-- sessions
	use({
		"shatur/neovim-session-manager",
		config = function()
			require("ui/plugins_setup/session_manager")
		end,
	})

	-- D2 diagramming tool
	use("terrastruct/d2-vim")
end)
