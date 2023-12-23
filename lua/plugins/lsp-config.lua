return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
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
          "eslint",
          "html",
          "jsonls",
          "jdtls",
          "kotlin_language_server",
          "tailwindcss"
        }
      })
    end
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
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.csharp_ls.setup({ capabilities = capabilities })
      lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", {})
      vim.keymap.set("n", "gf", ":Lspsaga lsp_finder<CR>", {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", {})
      vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", {})
      vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", {})
      vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", {})
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {})
    end
  },
}
