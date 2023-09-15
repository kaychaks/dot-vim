-- lualine status line

require("lualine").setup({
	options = {
		theme = "base16",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", separator = "" }, "diff" },
		lualine_c = { {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
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
		lualine_c = { {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
  tabline = {},
  extensions = { 'fugitive' }
})
