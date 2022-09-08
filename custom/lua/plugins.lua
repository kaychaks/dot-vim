-- fzf locations would change for linux and mac
local function fzf_by_os()
	local os = vim.loop.os_uname().sysname

	if string.lower(os) == "linux" then
		return "~/.nix-profile/share/vim-plugins/fzf"
	elseif string.lower(os) == "darwin" then
		return "/usr/local/Cellar/fzf/0.32.0"
	else
		return ""
	end
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
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

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- git
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })

	use("lewis6991/gitsigns.nvim")

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

	-- fuzzy finder
	use("airblade/vim-rooter")
	use({ fzf_by_os() })
	use("junegunn/fzf.vim")
end)
