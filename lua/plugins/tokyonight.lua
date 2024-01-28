return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "kitty",
      transparent = true,
      terminal_colors = true,
    })

    vim.cmd[[colorscheme tokyonight]]
  end
}
