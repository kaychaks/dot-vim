local actions = require("telescope.actions")
local Lib = require("lib")
require("telescope").setup({
	defaults = {
		path_display = { "truncate" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			n = { ["q"] = actions.close },
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.close,
			},
		},
	},
	pickers = {},
})

-- mappings
Lib.nnoremap({
	["<Leader>f"] = function()
		require("telescope.builtin").find_files({})
	end,

	["<Leader>ff"] = function()
		require("telescope.builtin").find_files({
			no_ignore = true,
			hidden = true,
		})
	end,

	["<Leader>fh"] = function()
		require("telescope.builtin").find_files({
			no_ignore = true,
			hidden = false,
		})
	end,

	["<Leader>F"] = function()
		require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() })
	end,

	["<Leader>b"] = function()
		require("telescope.builtin").buffers({})
	end,

	["<Leader>m"] = function()
		require("telescope.builtin").marks({})
	end,

	["<Leader>t"] = function()
		require("telescope.builtin").lsp_document_symbols({})
	end,

	["<Leader>h"] = function()
		require("telescope.builtin").help_tags({})
	end,

	["<Leader>gc"] = function()
		require("telescope.builtin").git_commits({})
	end,

	["<Leader>/"] = function()
		require("telescope.builtin").live_grep({})
	end,

	["<Leader>D"] = function()
		require("telescope.builtin").diagnostics({})
	end,
})
