-- // This installs and sets up the desired color scheme // --
-- // If you want, you can add your desired color schemes in similar fashion // --
-- // As an example, I have commented out catppuccin, you can uncomment and comment out koda // --

return {
    -- // Koda, uncomment and comment out others
    -- "oskarnurm/koda.nvim",
    -- lazy = false,       -- load immediately on startup
    -- priority = 1000,    -- load before all other plugins
    -- config = function()
    --     require("koda").setup({ transparent = true })
    --     vim.cmd("colorscheme koda-dark")
    -- end,

     "wtfox/luna.nvim",
     lazy = false,
     priority = 1000,
     config = function ()
         require("luna").setup({ transparent = true })
         vim.cmd("colorscheme luna")
     end

    -- // Catppuccin, uncomment and comment out others
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     config = function()
    --         require("catppuccin").setup({ transparent_background = true })
    --         vim.cmd("colorscheme catppuccin-mocha") -- mocha, macchiato, frappe, latte
    --     end,
    -- },
}
