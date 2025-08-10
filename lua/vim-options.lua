vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " " -- sets leader key to "space bar"

vim.cmd("let $PATH = '/home/hashir/.config/nvm/versions/node/v22.18.0/bin:' . $PATH")
-- you can switch this path with your nvm path, to know your nvm path type "which npm"
-- in your terminal after installing node and npm.

-- Line numbers
-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Make pink stick after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd [[highlight LineNr guifg=pink]]
    vim.cmd [[highlight CursorLineNr guifg=pink gui=bold]]
  end
})

-- Remove ~ from empty lines
vim.opt.fillchars = { eob = " " }

-- Highlight trailing spaces
vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
vim.cmd [[match ExtraWhitespace /\S\zs\s\+$/]]

-- Remove trailing whitespace on save
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

vim.g.lazy_git_timeout = 600

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

