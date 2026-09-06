-- // We will use mason to manage our lsps // --

return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()

        -- // To automatically install linter for Go
        local function ensure_installed(pkg)
            local mr = require("mason-registry")
            if not mr.is_installed(pkg) then
                vim.cmd("MasonInstall " .. pkg)
            end
        end

        ensure_installed("golangci-lint")

        -- // I am enabling and installing the lsps I use // --
        -- // You can add or remove the ones you want or dont want respectively, in similar fashion // --
        -- // You can manage them through ":Mason" // --
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "clangd",
                "html",
                "cssls",
                "lua_ls",
                "gopls",
                "emmet_language_server",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "eslint", -- linter for js/ts/html/css
                "ruff",   -- linter for python
            },
            automatic_installation = true,
        })

        -- // Pass blink.cmp capabilities to all LSP servers for proper completion support // --
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        vim.lsp.enable({
            "bashls",
            "clangd",
            "html",
            "cssls",
            "lua_ls",
            "emmet_language_server",
            "gopls",
            "pyright",
            "ts_ls",
            "rust_analyzer",
            "eslint",
            "ruff",
        })

        vim.diagnostic.config({ virtual_text = true }) -- controls how lsp diagnostics are displayed
    end,
}
