vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " " -- sets leader key to "space bar"

vim.cmd("let $PATH = '/home/hashir/.config/nvm/versions/node/v22.18.0/bin:' . $PATH")
-- you can switch this path with your nvm path, to know your nvm path type "which npm"
-- in your terminal after installing node and npm.

-- Line numbers
vim.opt.number = true          -- must be on for statuscolumn to render
vim.opt.relativenumber = false
vim.opt.numberwidth = 6        -- controls left padding width
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- aesthetics for line-numbers
local function apply_number_highlights()
  pcall(vim.cmd, "highlight! link LineNr Title")
  pcall(vim.cmd, "highlight! link CursorLineNr Title")
end

-- left padding: 2 spaces | right padding: 2 spaces
vim.opt.statuscolumn = "%#LineNr#  %{v:lnum}  "

apply_number_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    apply_number_highlights()
  end,
})

-- Remove ~ from empty lines
vim.opt.fillchars = { eob = " " }

-- Remove trailing whitespace on save
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

vim.g.lazy_git_timeout = 600

vim.keymap.set("i", "jk", "<Esc>", { noremap = true }) -- I did this because I like to use "jk" to enter normal mode rather than esc

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text in file" }) -- this makes it easier to select all the text on the match

vim.keymap.set("n", "yc", '"+yy', { noremap = true, silent = true }) -- to copy text
vim.keymap.set("v", "yc", '"+y', { noremap = true, silent = true })  -- to copt text
vim.keymap.set("n", "yp", '"+p', { noremap = true, silent = true })  -- to paste text
vim.keymap.set("v", "yp", '"+p', { noremap = true, silent = true }) -- to paste text
