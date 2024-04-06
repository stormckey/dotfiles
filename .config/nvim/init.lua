require("core/options")
require("core/keymaps")

-- smooth scrolling enabled by vim-smoothie
vim.api.nvim_set_keymap('n','<unique> <C-D>', '<cmd> call smoothie#do("\\<C-D>")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v','<unique> <C-D>', '<cmd> call smoothie#do("\\<C-D>")<CR>', { noremap = true })







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
require("lazy").setup({ 
    { import = "plugins" },
    { import = "plugins/lsp" }
}, {
    install = {
        colorscheme = { "nightfly"},
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false
    },
})

