  return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window :h hl-NormalNC
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {
            Normal = { bg = "#121212" },      -- Set background to #121212
            NormalFloat = { bg = "#121212" }, -- Ensure floating windows also have the same background
          }
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = {    -- map the value of 'background' option to a theme
          dark = "wave",  -- try "dragon" !
          light = "lotus"
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  }
