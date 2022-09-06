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

	-- git
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
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
		config = function()
			local Common = require("lang/common")
			local null_ls = require("null-ls")
			local sources = {
				-- js/ts/css
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.tsc,

				-- lua
				null_ls.builtins.formatting.stylua,

				-- rust
				null_ls.builtins.formatting.rustfmt,

				-- git
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.diagnostics.commitlint,

				-- shell
				null_ls.builtins.diagnostics.fish,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.code_actions.shellcheck,

				-- yaml
				null_ls.builtins.diagnostics.yamllint,

				-- nix
				null_ls.builtins.code_actions.statix,
				null_ls.builtins.diagnostics.statix,
				null_ls.builtins.formatting.nixfmt,
			}

			null_ls.setup({ sources = sources, debug = true, on_attach = Common.on_attach })
		end,
	})

	-- fuzzy finder
	use("airblade/vim-rooter")
	use({ fzf_by_os() })
	use("junegunn/fzf.vim")

	-- UI
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
		config = function()
			require("lualine").setup({
				options = {
					theme = "base16",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch", separator = "" }, "diff" },
					lualine_c = { "filename" },
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_lsp" },
							separator = "",
							symbols = { error = "", warn = "", info = "", hint = "" },
						},
						"fileformat",
						"filetype",
						"encoding",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	})
end)
