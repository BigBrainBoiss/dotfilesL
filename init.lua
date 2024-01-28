--[[Init.lua Neovim Configuration]]

-- [[LEADER KEYS]]
	vim.g.mapleader = ' '
	vim.g.maplocalleader = ' '
	
-- [[PLUGINS]]

-- Lazy.nvim

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    {import = "plugins"},
    {'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},
    {
      'preservim/vimux',
      config = function ()
        vim.g.VimuxOrientation = "h";
        vim.g.VimuxHeight = "40";
      end
    },
    {'sbdchd/neoformat'}
    })

  
-- [[OPTIONS/CONFIGURATION]]
	require('opts')

-- [[KEYBINDINGS]]
	require('keys')

-- [[VARIABLES/CONFIGURATION]]
	require('vars')

