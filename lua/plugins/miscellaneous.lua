-- // Miscellaneous plugins that require little to no configuration // --

return {
    -- // Noice: replaces the UI for messages, cmdline and popupmenu
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },

    -- // Markview: rendered markdown previews inside neovim
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
    },

    -- // Vim-Go: A plugin to enchance go development experience
    {
        "fatih/vim-go",
        lazy = false,
    },

    -- // Cord: discord rich presence
    {
        "vyfor/cord.nvim",
        event = 'VeryLazy',
        opts = {
            log_level = 'info',
            display = {
                theme = "minecraft",
                --  flavor = "accent",
            },
        },
    },
}
