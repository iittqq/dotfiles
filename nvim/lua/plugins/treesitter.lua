return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "cpp",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "html",
        "css",
        "markdown",
        "yaml",
        "toml",
        "java",
        "svelte",
        "vue",
        "tsx",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
