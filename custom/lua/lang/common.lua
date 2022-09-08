-- common configurations from language perspective

-- tree-sitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"rust",
		"javascript",
		"fish",
		"json",
		"markdown",
		"latex",
		"typescript",
		"tsx",
		"toml",
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})

--null-ls
local Util = require("lang/util")
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

null_ls.setup({ sources = sources, debug = true, on_attach = Util.on_attach })
