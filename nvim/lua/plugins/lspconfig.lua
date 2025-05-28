return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          prefix = "~", -- Customize this symbol if you'd like
          spacing = 2,
        },
        underline = true,
        signs = true,
        severity_sort = true,
        update_in_insert = false,
      })
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      lspconfig.lua_ls.setup({ capabilities = capabilities })

      lspconfig.tsserver.setup({
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      })

      lspconfig.eslint.setup({
        cmd = { "eslint_d", "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        capabilities = capabilities,
      })

      lspconfig.svelte.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      lspconfig.pyright.setup({})

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.jdtls.setup({
        cmd = { "jdtls" },
        root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
        settings = {
          java = {
            format = {
              settings = {
                profile = "GoogleStyle",
              },
            },
          },
        },
      })
    end,
  },
}
