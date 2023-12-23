return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua", 
        "javascript", 
        "typescript", 
        "vimdoc", 
        "query", 
        --    "angular", --Experimental 
        "bash", 
        "c_sharp", 
        "css", 
        "html",
        "java",
        "kotlin",
        "sql"
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
