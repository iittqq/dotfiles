return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      svelte = { "prettierd" },
      python = { "black" },
      lua = { "stylua" },
      java = { "google-java-format" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
  },
}
