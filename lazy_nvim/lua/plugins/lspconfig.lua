return {
  "neovim/nvim-lspconfig",
  dependencies = { "simrat39/rust-tools.nvim" },
  opts = {
    setup = {
      rust_analyzer = function()
        require("rust-tools").setup()
      end,
      tailwindcss = function(_, opts)
        require("lspconfig").tailwindcss.setup(opts)
      end,
      emmet_ls = function(_, opts)
        require("lspconfig").emmet_ls.setup(opts)
      end,
      svelte = function(_, opts)
        require("lspconfig").svelte.setup(opts)
      end,
    },
  },
}
