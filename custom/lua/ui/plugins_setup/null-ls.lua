--null-ls
local Util = require("lang/util")
local null_ls = require("null-ls")
local sources = {
	-- js/ts/css
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.diagnostics.eslint_d.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
	}),

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
