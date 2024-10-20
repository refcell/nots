return function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = require("dash.banners")["angyskull"]
    dashboard.section.header.val = logo
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    -- dashboard.section.header.opts.hl = {
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaHeader", 0, 0 } },
    --   { { "AlphaButtons", 0, 1000 } },
    --   { { "AlphaHeader", 0, 50 }, { "AlphaFooter", 50, 80 }, { "AlphaButtons", 80, 120 } },
    --   { { "AlphaHeader", 0, 50 }, { "AlphaFooter", 50, 90 }, { "AlphaButtons", 90, 120 } },
    --   {
    --     { "AlphaHeader", 0, 45 },
    --     { "AlphaShortcut", 45, 75 },
    --     { "Error", 75, 90 },
    --     { "AlphaFooter", 90, 120 },
    --     { "AlphaButtons", 120, 135 },
    --     { "NvimTreeSymlink", 135, 200 },
    --   },
    --   {
    --     { "AlphaHeader", 0, 45 },
    --     { "AlphaShortcut", 45, 65 },
    --     { "Error", 65, 85 },
    --     { "AlphaFooter", 85, 113 },
    --     { "AlphaButtons", 113, 130 },
    --     { "NvimTreeSymlink", 130, 200 },
    --   },
    --   {
    --     { "AlphaHeader", 0, 43 },
    --     { "AlphaShortcut", 43, 72 },
    --     { "Error", 72, 97 },
    --     { "AlphaFooter", 97, 122 },
    --     { "AlphaButtons", 122, 140 },
    --     { "NvimTreeSymlink", 140, 200 },
    --   },
    --   {
    --     { "AlphaHeader", 0, 45 },
    --     { "AlphaShortcut", 45, 67 },
    --     { "Error", 67, 97 },
    --     { "AlphaFooter", 97, 120 },
    --     { "AlphaButtons", 120, 135 },
    --     { "NvimTreeSymlink", 135, 200 },
    --   },
    --   {
    --     { "AlphaHeader", 0, 42 },
    --     { "AlphaShortcut", 42, 73 },
    --     { "Error", 73, 106 },
    --     { "AlphaFooter", 106, 125 },
    --     { "AlphaButtons", 125, 143 },
    --     { "NvimTreeSymlink", 143, 200 },
    --   },
    -- }
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end
