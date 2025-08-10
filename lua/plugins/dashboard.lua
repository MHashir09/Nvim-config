return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Helper function to close dashboard buffer properly before opening a new window/command
    local function open_and_close_dashboard(cmd)
      local bufnr = vim.api.nvim_get_current_buf()
      -- Create a new empty buffer to switch away from dashboard
      vim.cmd('enew')
      -- Delete dashboard buffer forcefully
      vim.api.nvim_buf_delete(bufnr, {force = true})
      -- Run the command
      vim.cmd(cmd)
    end

    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = {
          ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
          ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
          ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
          ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
          ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
          ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },
        center = {
          {
            icon = ' ',
            desc = 'Recently opened files',
            action = function()
              open_and_close_dashboard('Telescope oldfiles')
            end,
            shortcut = 'SPC f r',
          },
          {
            icon = ' ',
            desc = 'Find File',
            action = function()
              open_and_close_dashboard('Telescope find_files')
            end,
            shortcut = 'SPC f f',
          },
          {
            icon = ' ',
            desc = 'Find Word',
            action = function()
              open_and_close_dashboard('Telescope live_grep')
            end,
            shortcut = 'SPC f w',
          },
          {
            icon = ' ',
            desc = 'Open config',
            action = function()
              open_and_close_dashboard('edit ~/.config/nvim/init.lua')
            end,
            shortcut = 'SPC f c',
          },
        },
        footer = { 'Have a nice day!' },
      },

      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },

      preview = {
        command = nil,
        file_path = nil,
        file_height = 0,
        file_width = 0,
      },
    }

    -- Fix highlight colors in pink (#ff66cc)
    vim.cmd [[
      highlight clear DashboardHeader
      highlight clear DashboardCenter
      highlight clear DashboardShortCut
      highlight clear DashboardFooter

      highlight DashboardHeader    guifg=#ff66cc guibg=NONE gui=bold
      highlight DashboardCenter    guifg=#ff66cc guibg=NONE
      highlight DashboardShortCut  guifg=#ff66cc guibg=NONE gui=bold
      highlight DashboardFooter    guifg=#ff66cc guibg=NONE
      highlight ExtraWhitespace guibg=NONE
    ]]
  end,
}


