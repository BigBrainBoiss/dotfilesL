return {
  "folke/zen-mode.nvim",
  opts= {
    window = {
      width = function()
        if vim.o.columns <= 74 then
          return 59
        end
      end,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
      }
    },
  }
}
