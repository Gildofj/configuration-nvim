return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"csharp_ls",
					"cssmodules_ls",
					"emmet_ls",
					"html",
					"jsonls",
					"jdtls",
					"kotlin_language_server",
					"tailwindcss",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d", -- js linter
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.csharp_ls.setup({ capabilities = capabilities })
			lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
			})
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
			vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)
			vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
			vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
			vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end,
	},
}
