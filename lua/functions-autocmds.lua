-- // ############################## // --
-- // #### AUTOCMDS & FUNCTIONS #### // --
-- // ############################## // --

local M = {}
local autocmd = vim.api.nvim_create_autocmd

-- // Briefly flashes the yanked(copied) region after you yank(copy)
autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
})

-- // Removes trailing white spaces and recovers the cursor position after that
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})

-- // This links the line number colors to colorscheme's Title highlight group
local function apply_number_highlights()
    pcall(vim.cmd, "highlight! link LineNr Title")
    pcall(vim.cmd, "highlight! link CursorLineNr Title")
end

apply_number_highlights() -- run once on startup

autocmd("ColorScheme", {
    callback = function()
        apply_number_highlights() -- re-run on theme change
    end,
})

-- // For linting on save for Go lang using golangci-lint
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.go",
    callback = function()
        vim.fn.jobstart("golangci-lint run --out-format=line-number", {
            stdout_buffered = true,
            on_stdout = function(_, data)
                if data then
                    vim.fn.setqflist({}, " ", {
                        title = "golangci-lint",
                        lines = data,
                        efm = "%f:%l:%c: %m",
                    })
                end
            end,
        })
    end,
})

-- // Native terminal settings
local terminal_buf = -1 -- tracks the terminal buffer across toggles
local terminal_win = -1 -- tracks the terminal window across toggles

M.toggle_terminal = function()
    -- if terminal is open, close it
    if vim.api.nvim_win_is_valid(terminal_win) then
        vim.api.nvim_win_close(terminal_win, false)
        terminal_win = -1
        return
    end
    -- open a horizontal split at the bottom, 10 lines tall
    vim.cmd("belowright split")
    vim.cmd("resize 10")
    terminal_win = vim.api.nvim_get_current_win()
    -- reuse existing terminal session if available, otherwise create a new one
    if vim.api.nvim_buf_is_valid(terminal_buf) then
        vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
    else
        vim.cmd("terminal")
        terminal_buf = vim.api.nvim_get_current_buf()
    end
    vim.cmd("startinsert") -- enter insert mode automatically
end

return M
