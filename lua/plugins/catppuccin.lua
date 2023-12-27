return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup()
    vim.cmd.colorscheme("catppuccin")
    -- vim.cmd.colorscheme("catppuccin-latte")
  end,
}
