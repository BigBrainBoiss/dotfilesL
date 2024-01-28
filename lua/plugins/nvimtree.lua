--local function my_on_attach(bufnr)
--  local api = require "nvim-tree.api"

--  local function opts(desc)
--    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
--  end

--  api.config.mappings.default_on_attach(bufnr)
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  indent_markers = {
    enable = false,
    inline_arrows = true,
    icons = {
      corner = "└",
      edge = "│",
      item = "│",
      bottom = "─",
      none = " ",
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        
        --default mapping when inside of nvim tree
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "L", api.node.open.vertical, opts("Open: Vertical Split"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Openl: Horizontal Split"))
      end,
    })

  end,
}
