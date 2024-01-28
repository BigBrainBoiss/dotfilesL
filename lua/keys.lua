-- [[KEYBINDINGS]]
-- Exit out of insert mode
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'KJ', '<Esc>')

-- Page up/down and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')


--[[PLUGINS]]

--NVIM-TREE

-- Nvim-Tree toggle
vim.keymap.set("n", "<leader>s", function()
  require("nvim-tree.api").tree.toggle()
end )

-- Nvim-Tree toggle and select current file
vim.keymap.set("n", "<leader>S", function()
  require("nvim-tree.api").tree.open({ find_file = true })
end )

--TRUE-ZEN

--Toggles for different true-zen modes
local api = vim.api

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

--ZEN-MODE

--Toggle zen mode
api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", {})

--RUNNING CODE
vim.keymap.set('n', '<Esc>n', function ()
  if vim.fn.expand("%:e") == "js" then
    vim.cmd("AsyncRun -mode=term -pos=tmux node \"$(VIM_FILEPATH)\"")
  elseif vim.fn.expand("%:e") == "c" then
    vim.cmd("AsyncRun -mode=term -pos=tmux gcc \"$(VIM_FILEPATH)\" -o  \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" && cd $(VIM_FILEDIR) && ./$(VIM_FILENOEXT)")
  elseif vim.fn.expand("%:e") == "py" then
    vim.cmd("AsyncRun -mode=term -pos=tmux python \"$(VIM_FILEPATH)\"")
  elseif vim.fn.expand("%:e") == "go" then 
    vim.cmd("AsyncRun -mode=term -pos=tmux go run \"$(VIM_FILEPATH)\"")
  elseif vim.fn.expand("%:e") == "" then 
    vim.cmd("AsyncRun -mode=term -pos=tmux bash \"$(VIM_FILEPATH)\"")
  end
end)
