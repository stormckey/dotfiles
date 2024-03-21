-- change <Space> as leading
vim.g.mapleader = " "
-- smooth scrolling enabled by vim-smoothie
vim.api.nvim_set_keymap('n','<unique> <C-D>', '<cmd> call smoothie#do("\\<C-D>")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v','<unique> <C-D>', '<cmd> call smoothie#do("\\<C-D>")<CR>', { noremap = true })
-- enable copy to system clipboard
vim.cmd('set clipboard=unnamedplus')

-- initialize lazy.nvim
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

-- let lazy to obtain plugins from subdirectories
require("lazy").setup("plugins")

-- set tab as 4 space
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')

