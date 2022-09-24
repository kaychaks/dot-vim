-- completion setting via cmp engine

local cmp = require("cmp")
local lspkind = require("lspkind")

local function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	preselect = cmp.PreselectMode.None,
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
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
		}),
	},
	duplicates = {
		nvim_lsp = 1,
		cmp_tabnine = 1,
		buffer = 1,
		path = 1,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},

	sources = {
		{
			name = "nvim_lsp",
			priority = 1000,
		},
		{
			name = "nvim_lsp_signature_help",
			priority = 900,
		},
		{
			name = "nvim_lsp_document_symbol",
			priority = 800,
		},
		{
			name = "crates",
			priority = 800,
			keyword_length = 4,
		},
		{ name = "npm", keyword_length = 4 },
		{
			name = "nvim_lua",
			priority = 750,
		},
		{
			name = "path",
			priority = 500,
		},
		{
			name = "buffer",
			priority = 500,
			keyword_length = 3,
		},
		{
			name = "latex_symbols",
		},
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})
