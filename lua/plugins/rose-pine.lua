return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 2000,   -- To make this plugin load before every other plugin
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      
      highlight_groups = {

        -- Highlight group for neotree --

        -- Pink file names
            NeoTreeFileName = { fg = "love" },
            NeoTreeFileIcon = { fg = "love" },
        -- Lavender for directories (creates a soft gradient feel)
            NeoTreeDirectoryName = { fg = "iris" },
            NeoTreeDirectoryIcon = { fg = "iris" },
        -- Softer background for tree
            NeoTreeNormal = { fg = "love", bg = "base" },
            NeoTreeNormalNC = { fg = "love", bg = "base" },
        -- Gradient separator
            NeoTreeWinSeparator = { fg = "highlight_med", bg = "none" },
        -- Optional: Adjust symbols and git status colors
            NeoTreeGitUntracked = { fg = "iris" },
            NeoTreeGitModified = { fg = "love" },
            NeoTreeGitAdded = { fg = "foam" },
            NeoTreeGitDeleted = { fg = "love" },

        -- Highlight group for telescope --

            TelescopeBorder = { fg = "overlay", bg = "overlay" },
            TelescopeNormal = { fg = "subtle", bg = "overlay" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
            TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
            TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

            TelescopeTitle = { fg = "base", bg = "love" },
            TelescopePromptTitle = { fg = "base", bg = "pine" },
            TelescopePreviewTitle = { fg = "base", bg = "iris" },
            TelescopePromptNormal = { fg = "text", bg = "surface" },
            TelescopePromptBorder = { fg = "surface", bg = "surface" },
      }

    })
    vim.cmd("colorscheme rose-pine")
  end,
}
 
