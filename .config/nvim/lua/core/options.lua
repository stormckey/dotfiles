local opt = vim.opt -- abbr

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rs",
	command = "setlocal shiftwidth=2 tabstop=2"
})
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- expand word definition 
opt.iskeyword:append("-")
