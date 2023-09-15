-- fzf locations would change for linux and mac
local function fzf_by_os()
	local os = vim.loop.os_uname().sysname

	if string.lower(os) == "linux" then
		return "~/.nix-profile/share/vim-plugins/fzf"
	elseif string.lower(os) == "darwin" then
		return "/usr/local/Cellar/fzf/0.33.0"
	else
		return ""
	end
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	--impatient (to fasten lua module loading)
	use("lewis6991/impatient.nvim")

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	-- color scheme
	use("RRethy/nvim-base16")

	-- UI

	-- sorround
	use("tpope/vim-surround")

	-- autopair
	use("jiangmiao/auto-pairs")

	-- which key
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	-- tabs & buffers
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})
	use("famiu/bufdelete.nvim")

	-- filetree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- indentation guide
	use("lukas-reineke/indent-blankline.nvim")

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- session manager

	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("session_manager").setup()
		end,
		event = "BufWritePost",
		cmd = "SessionManager",
		module = "session_manager",
	})

	-- git
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })

	use("lewis6991/gitsigns.nvim")

	-- gutter
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	-- lsp
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})
	use("neovim/nvim-lspconfig")
	use("simrat39/rust-tools.nvim")
	use("LnL7/vim-nix")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

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

	use("hrsh7th/nvim-cmp", {
		event = "InsertEnter",
		after = "lspkind"
	})

	use("hrsh7th/cmp-buffer", {
		after = "nvim-cmp",
	})

	use("hrsh7th/cmp-path", {
		after = "nvim-cmp",
	})

	use("hrsh7th/cmp-path", {
		after = "nvim-cmp",
	})

	-- fuzzy finder
	use("airblade/vim-rooter")
	use({ fzf_by_os() })
	use("junegunn/fzf.vim")
end)
