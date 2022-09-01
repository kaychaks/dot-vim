-- fzf locations would change for linux and mac
local function fzf_by_os ()
	local os = vim.loop.os_uname().sysname

	if string.lower(os) == "linux" then
		return "~/.nix-profile/share/vim-plugins/fzf"
	else
		return ""
	end
end

require('packer').startup(function(use) 
	use 'wbthomason/packer.nvim'

	-- fuzzy finder
	use 'airblade/vim-rooter' 
	use { fzf_by_os() }
	use 'junegunn/fzf.vim'
end)