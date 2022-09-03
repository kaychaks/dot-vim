-- fzf locations would change for linux and mac
local function fzf_by_os ()
	local os = vim.loop.os_uname().sysname

	if string.lower(os) == "linux" then
		return "~/.nix-profile/share/vim-plugins/fzf"
	elseif string.lower(os) == "darwin" then
		return "/usr/local/Cellar/fzf/0.32.0"
	else
		return ""
	end
end

require('packer').startup(function(use) 
	use 'wbthomason/packer.nvim'
	use  { "williamboman/mason.nvim", 
		config = function()
			require("mason").setup()
		end
	}

	-- color scheme
	use 'bradcush/base16-nvim'

	-- lsp
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
	use 'simrat39/rust-tools.nvim'

	-- fuzzy finder
	use 'airblade/vim-rooter' 
	use { fzf_by_os() }
	use 'junegunn/fzf.vim'
end)
