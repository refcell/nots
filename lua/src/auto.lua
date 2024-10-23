-- Autocommands

local colors = {
  fg = "#76787d",
  bg = "#252829",
}

-- Updates the color scheme every 10 seconds
vim.fn.timer_start(10000, function()
  require("utils.utils").check_and_update_color_scheme()
end, { ["repeat"] = -1 })

-- Show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
vim.api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

local autocmd_dict = {
  BufEnter = {
    {
      -- don't auto comment new line
      pattern = "*",
      command = [[set formatoptions-=cro]],
    },
    {
      pattern = "*",
      callback = function() end,
    },
  },
  Filetype = {
    {
      -- Fix terraform and hcl comment string
      group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
      callback = function(ev)
        vim.bo[ev.buf].commentstring = "# %s"
      end,
      pattern = { "terraform", "hcl" },
    },
    {
      -- Close some filetypes with <q>
      group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
      pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
      },
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    },
    {
      -- Remap q to quit
      pattern = "man",
      command = [[nnoremap <buffer><silent> q :quit<CR>]],
    },
    {
      -- Wrap words "softly" (no carriage return) in mail buffer
      pattern = "mail",
      callback = function()
        vim.opt.textwidth = 0
        vim.opt.wrapmargin = 0
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.columns = 80
        vim.opt.colorcolumn = "80"
      end,
    },
  },
  VimEnter = {
    {
      -- Toggle showkeys on startup
      callback = function()
        require("showkeys").toggle()
      end,
    },
    {
      -- Check the color scheme on startup
      callback = function()
        require("utils.utils").check_and_update_color_scheme()
      end,
    },
  },
  TextYankPost = {
    {
      -- Highlight on yank
      callback = function()
        vim.highlight.on_yank()
      end,
    },
  },
  BufReadPost = {
    {
      -- Go to the last loc when opening a buffer
      callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
      end,
    },
  },
  BufWritePre = {
    {
      -- Remove trailing whitespace on save
      command = [[%s/\s\+$//e]],
    },
  },
  WinEnter = {
    {
      -- Set colorcolumn to 120
      command = [[set colorcolumn=120]],
    },
  },
  WinLeave = {
    {
      -- Set colorcolumn to 0
      command = [[set colorcolumn=0]],
    },
  },
  ColorScheme = {
    {
      -- Change the background color of floating windows and borders.
      callback = function()
        vim.cmd("highlight NormalFloat guibg=none guifg=none")
        vim.cmd("highlight FloatBorder guifg=" .. colors.fg .. " guibg=none")
        vim.cmd("highlight NormalNC guibg=none guifg=none")

        -- change neotree background colors
        -- Default: NeoTreeNormal  xxx ctermfg=223 ctermbg=232 guifg=#d4be98 guibg=#141617
        -- vim.cmd('highlight NeoTreeNormal guibg=#252e33 guifg=none')
        -- vim.cmd('highlight NeoTreeFloatNormal guifg=none guibg=none')
        -- vim.cmd('highlight NeoTreeFloatBorder gui=none guifg=' .. colors.fg .. ' guibg=none')
        -- vim.cmd('highlight NeoTreeEndOfBuffer guibg=#252e33') -- 1d2021

        vim.cmd("highlight Comment guifg=#475558")
      end,
    },
  },
}

for event, opt_tbls in pairs(autocmd_dict) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end
