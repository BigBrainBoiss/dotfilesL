-- [[OPTIONS/CONFIGURATION]]

	local o = vim.o
	local api = vim.api
	-- Size of tab
  o.tabstop = 2
  o.shiftwidth = 2
	o.softtabstop = 2
	o.expandtab = true

	-- Hybrid line numbers
	o.number = true
	o.relativenumber = true
	o.scrolloff = 8
	
	-- Theme
	o.syntax = "ON"
	o.termguicolors = true

  -- Copy to clipboard
  o.clipboard= "unnamedplus"
  -- Line break only for .txt and .md files
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.txt", "*.md"},
    callback =  function() o.linebreak = true end,
  })

  --Detect filetype
  o.filetype = true

  --Colors for number lines
  api.nvim_set_hl(0, 'LineNr', {fg = "#f1bd21"})
  api.nvim_set_hl(0, 'LineNrBelow', {fg = "#666b73"})
  api.nvim_set_hl(0, 'LineNrAbove', {fg = "#666b73"})

  --Highlighting off when searching
  o.hlsearch = false

  --Highlight when text is yanked
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*'
  })
  -- Enable mouse mode
  o.mouse = 'a'

  -- Save undo history
  o.undofile = true

  -- Case insensitive searching
  o.ignorecase = true
  o.smartcase = true
