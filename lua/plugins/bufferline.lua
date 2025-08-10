---@diagnostic disable: undefined-global
return {
  "akinsho/bufferline.nvim",
  event = "UIEnter",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>cd", "<Cmd>bdelete<CR>", desc = "Close Current Buffer" },

    { "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
    { "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
    { "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
    { "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
    { "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
    { "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
    { "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
    { "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
    { "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
    { "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", desc = "Go to last buffer" },
  },

  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        diag = diag or {}
        local parts = {}
        if diag.error and diag.error > 0 then
          table.insert(parts, " " .. tostring(diag.error))
        end
        if diag.warning and diag.warning > 0 then
          table.insert(parts, " " .. tostring(diag.warning))
        end
        if diag.info and diag.info > 0 then
          table.insert(parts, " " .. tostring(diag.info))
        end
        if diag.hint and diag.hint > 0 then
          table.insert(parts, " " .. tostring(diag.hint))
        end
        return #parts > 0 and table.concat(parts, " ") or ""
      end,

      separator_style = "slant",

      get_element_icon = function(opts)
        opts = opts or {}
        local ok, devicons = pcall(require, "nvim-web-devicons")
        if ok and devicons and type(devicons.get_icon) == "function" then
          local icon = devicons.get_icon(opts.filetype or opts.name or "", nil, { default = true })
          if icon then
            return icon, "BufferlinePink"
          end
        end
        return "", "BufferlinePink"
      end,

      tab_size = 26,
      max_name_length = 30,
      tab_padding = 6,

      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = true,

      -- LEFT GAP: insert a blank region equal to numberwidth + signcolumn extra + small extra gap
      custom_areas = {
        left = function()
          local ok, res = pcall(function()
            local winid = vim.api.nvim_get_current_win()

            -- safely get numberwidth (may be string/number depending on nvim version)
            local nw = 0
            local ok1, raw_nw = pcall(vim.api.nvim_win_get_option, winid, "numberwidth")
            if ok1 then
              if type(raw_nw) == "number" then
                nw = raw_nw
              else
                nw = tonumber(raw_nw) or 0
              end
            end

            -- signcolumn presence may add extra gutter; treat "yes" or "number" as having signs
            local sign_extra = 0
            local ok2, sc = pcall(vim.api.nvim_win_get_option, winid, "signcolumn")
            if ok2 and type(sc) == "string" then
              if sc == "yes" or sc == "number" then
                sign_extra = 2
              end
            end

            local extra = 2 -- tweak this value for more/less gap after numbers
            local total = nw + sign_extra + extra
            if total < 1 then total = 1 end

            local spaces = string.rep(" ", total)
            -- bufferline expects a list of area tables
            return { { text = spaces } }
          end)

          if ok and res then
            return res
          end
          return {}
        end,
      },
    },

    highlights = {
      fill = { fg = "#9aa0a6", bg = "NONE" },
      background = { fg = "#9aa0a6", bg = "NONE" },

      buffer_selected = { fg = "#ffffff", bg = "NONE", bold = true },
      buffer_visible = { fg = "#cfcfcf", bg = "NONE" },

      tab_selected = { fg = "#ff66b2", bg = "NONE", bold = true },
      tab = { fg = "#cfcfcf", bg = "NONE" },

      separator = { fg = "#2e2e2e", bg = "NONE" },
      separator_selected = { fg = "#ff66b2", bg = "NONE" },
      separator_visible = { fg = "#ff66b2", bg = "NONE" },

      error = { fg = "#ff66b2", bg = "NONE" },
      error_selected = { fg = "#ff66b2", bg = "NONE" },
      error_visible = { fg = "#ff66b2", bg = "NONE" },

      warning = { fg = "#ff66b2", bg = "NONE" },
      warning_selected = { fg = "#ff66b2", bg = "NONE" },
      warning_visible = { fg = "#ff66b2", bg = "NONE" },

      info = { fg = "#ff66b2", bg = "NONE" },
      info_selected = { fg = "#ff66b2", bg = "NONE" },
      info_visible = { fg = "#ff66b2", bg = "NONE" },

      hint = { fg = "#ff66b2", bg = "NONE" },
      hint_selected = { fg = "#ff66b2", bg = "NONE" },
      hint_visible = { fg = "#ff66b2", bg = "NONE" },

      modified = { fg = "#ff66b2", bg = "NONE" },
      modified_selected = { fg = "#ff66b2", bg = "NONE" },
      modified_visible = { fg = "#ff66b2", bg = "NONE" },
    },
  },

  config = function(_, opts)
    pcall(function()
      vim.diagnostic.config({ update_in_insert = true })
    end)

    pcall(vim.api.nvim_set_hl, 0, "BufferlinePink", { fg = "#ff66b2", bold = true })

    local ok, bufferline = pcall(require, "bufferline")
    if not ok or not bufferline then
      return
    end
    pcall(bufferline.setup, opts or {})
  end,
}

