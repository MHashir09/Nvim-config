return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"emmet_ls", -- Emmet for fast HTML/CSS
					"ts_ls", -- JavaScript & TypeScript
					"yamlls", -- YAML
					"bashls", -- Bash/Shell scripts
					"lua_ls", -- Lua
					"pyright", -- Python
					"clangd", -- C, C++
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local lspconfig = require("lspconfig")
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.emmet_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })

			vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Diagnostics display config
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					vim.diagnostic.config({
						update_in_insert = false, -- turn it to truw if you want to see diagnostics in insert mode
						virtual_text = {
							severity = { min = vim.diagnostic.severity.WARN }, -- this and signs below hide hints and stuff because it was realy annoying me. If you want that feature then comment out both severity objects and replace them with "true"
						},
						signs = {
							severity = { min = vim.diagnostic.severity.WARN },
						},
						underline = false,
						float = { border = "rounded" },
					})
				end,
			})

			-- Show diagnostics on hover
			vim.o.updatetime = 250
			vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		end,
	},
}
