local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")
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
				["<C-s>"] = layout.toggle_preview,
				["<C-t>"] = function(...)
					require("trouble.providers.telescope").open_with_trouble(...)
				end,
			},
		},
	},
	pickers = {},
})

-- load telescope extension
--require("telescope").load_extension("ui-select")

-- mappings
Lib.nnoremap({
	-- find files root dir
	["<Leader>f"] = function()
		require("telescope.builtin").find_files({})
	end,

	-- find all files including ignored and hidden
	["<Leader>ff"] = function()
		require("telescope.builtin").find_files({
			no_ignore = true,
			hidden = true,
		})
	end,

	-- find all files including ignored excluding hidden
	["<Leader>fh"] = function()
		require("telescope.builtin").find_files({
			no_ignore = true,
			hidden = false,
		})
	end,

	-- find files in current buffer's directory
	["<leader>F"] = function()
		require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() })
	end,

	-- find recent files
	["<leader>fr"] = function()
		require("telescope.builtin").oldfiles({})
	end,

	-- switch buffers
	["<Leader>b"] = function()
		require("telescope.builtin").buffers({ show_all_buffers = true })
	end,

	-- jump to mark
	["<Leader>m"] = function()
		require("telescope.builtin").marks({})
	end,

	-- goto symbols
	["<Leader>t"] = function()
		require("telescope.builtin").lsp_document_symbols({
			symbols = {
				"Class",
				"Function",
				"Method",
				"Constructor",
				"Interface",
				"Module",
				"Struct",
				"Trait",
				"Field",
				"Property",
			},
		})
	end,

	-- help pages
	["<Leader>h"] = function()
		require("telescope.builtin").help_tags({})
	end,

	--  git commits
	["<Leader>gc"] = function()
		require("telescope.builtin").git_commits({})
	end,

	-- grep (root dir)
	["<Leader>sg"] = function()
		require("telescope.builtin").live_grep({})
	end,

	-- grep
	["<Leader>sG"] = function()
		require("telescope.builtin").live_grep({ cwd = false })
	end,

	-- search word (root dir)
	["<Leader>sw"] = function()
		require("telescope.builtin").grep_string({})
	end,

	-- search word in cwd
	["<Leader>sW"] = function()
		require("telescope.builtin").grep_string({ cwd = false })
	end,

	-- keymaps
	["<Leader>sk"] = function()
		require("telescope.builtin").keymaps({})
	end,

	-- vim options
	["<Leader>so"] = function()
		require("telescope.builtin").vim_options({})
	end,

	-- diagnostics
	["<Leader>D"] = function()
		require("telescope.builtin").diagnostics({})
	end,

	-- references
	["gR"] = function()
		require("telescope.builtin").lsp_references({})
	end,
})
