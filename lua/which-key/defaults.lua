return {
  mode = { "n" },
  [";"] = { ":Alpha<CR>", "Dashboard" },
  ["/"] = {
    function()
      require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
    end,
    "Toggle comment",
  },
  ["1"] = {
    function()
      require("lsp_lines").toggle()
      local virtual_lines_enabled = vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = not virtual_lines_enabled })
    end,
    "Toggle LSP Lines diagnostics",
  },
  ["2"] = {
    function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end,
    "Toggle inlay hints",
  },
  w = { ":w!<CR>", "Save" },
  q = { ":confirm q<CR>", "Quit" },
  c = { ":bd<CR>", "Close Buffer" },
  v = "Go to definition in a split",
  a = "Swap next param",
  A = "Swap previous param",
  U = { ":UndotreeToggle<CR>", "Toggle UndoTree" },
  o = { ":Telescope buffers<CR>", "Open Buffer" },
  n = { ":GlobalNote<CR>", "Open Global Note" },
  e = {
    function()
      local top_level = vim.fn.getcwd()
      vim.cmd([[:Oil --float ]] .. top_level)
    end,
    "Open Oil",
  },
  u = {
    name = "UI",
    c = { "<cmd>lua require('utils.utils').toggle_set_color_column()<CR>", "Toggle Color Line" },
    l = { "<cmd>lua require('utils.utils').toggle_cursor_line()<CR>", "Toggle Cursor Line" },
    b = { "<cmd>lua require('utils.utils').toggle_background()<CR>", "Toggle Background" },
  },
  b = {
    name = "Buffers",
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    r = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  g = {
    name = "+Git",
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
    g = {
      "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='lazygit'}:toggle()<cr>",
      "Lazygit",
    },
    o = { "<cmd>OpenInGHRepo<cr>", "Open Repo in GitHub" },
    f = { "<cmd>OpenInGHFile<cr>", "Open File in GitHub" },
  },
  l = {
    name = "+LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    A = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Range Code Actions" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    R = { "<cmd>Telescope lsp_references<cr>", "References" },
    s = { "<cmd>Trouble symbols toggle win.position=left focus=false<cr>", "Display LSP Symbols (Document)" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename all references" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    l = { "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>", "Document Diagnostics (Trouble)" },
    L = { "<cmd>Trouble diagnostics toggle focus=true<cr>", "Workspace Diagnostics (Trouble)" },
    h = { "<cmd>lua require('utils.utils').toggle_inlay_hints()<CR>", "Toggle Inlay Hints" },
  },
  f = {
    name = "+Search",
    f = { "<cmd>Telescope find_files<cr>", "Find File (CWD)" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    v = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current file" },
    W = { "<cmd>Telescope grep_string<cr>", "Grep String" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
    z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    t = { "<cmd>Telescope colorscheme<cr>", "Color schemes" },
  },
  h = {
    name = "+Harpoon",
    m = {
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Harpoon Menu",
    },
    a = {
      function()
        require("harpoon"):list():append()
      end,
      "Harpoon File",
    },
    ["1"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Harpoon File #1",
    },
    ["2"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Harpoon File #2",
    },
    ["3"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Harpoon File #3",
    },
    ["4"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Harpoon File #4",
    },
    f = {
      function()
        local conf = require("telescope.config").values
        local harpoon_files = require("harpoon"):list()
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end,
      "Find Harpoon File",
    },
  },
  -- z = {
  --   name = "Folding",
  --   R = { "<cmd>lua require'ufo'.openAllFolds<cr>", "Open all folds" },
  --   M = { "<cmd>lua require'ufo'.closeAllFolds<cr>", "Close all folds" },
  --   -- r = { "<cmd>lua require'ufo'.openFoldsExceptKinds<cr>", "Open fold except kinds" },
  --   -- m = { "<cmd>lua require'ufo'.closeFoldsWith<cr>", "Close fold with" },
  -- },
}
