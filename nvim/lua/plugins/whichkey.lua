local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local harpoon = require("harpoon")
  harpoon:setup({})
  require("which-key").setup({
    {
      plugins = {
        marks = true,       -- shows a list of your marks on ' and `
        registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true,       -- default bindings on <c-w>
          nav = true,           -- misc bindings to work with windows
          z = true,             -- bindings for folds, spelling and others prefixed with z
          g = true,             -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "left",                                                             -- align columns left, center or right
      },
      ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true,                                                             -- show help message on the command line when the popup is visible
      triggers = "auto",                                                            -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }
  })

  local mappings = {
    { "<leader>a", "<cmd>Alpha<cr>",                                                                                                    desc = "Alpha" },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",    desc = "Buffers", },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>",                                                                                           desc = "Explorer" },
    { "<leader>c", "<cmd>bdelete!<CR>",                                                                                                 desc = "Close Buffer" },
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files", },
    { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>",                                                                            desc = "Find Text" },
    { "<leader>P", "<cmd>Telescope projects<cr>",                                                                                       desc = "Projects" },

    {
      "<leader>p",
      group = "Goto Preview",
      { "<leader>pd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",      desc = "Definition" },
      { "<leader>pt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Type Definition" },
      { "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",  desc = "Implementation" },
      { "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",      desc = "References" },
      { "<leader>px", "<cmd>lua require('goto-preview').close_all_win()<CR>",                desc = "Close all windows" },
    },

    {
      "<leader>g",
      group = "Git",
      { "<leader>go", "<cmd>Telescope git_status<cr>",   desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Checkout commit" },
    },

    {
      "<leader>h",
      group = "Harpoon",
      { "<leader>ha", function() harpoon:list():add() end,                         desc = "Add file to harpoon list" },
      { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle harpoon list" },
      { "<leader>h1", function() harpoon:list():select(1) end,                     desc = "Goto file 1" },
      { "<leader>h2", function() harpoon:list():select(2) end,                     desc = "Goto file 2" },
      { "<leader>h3", function() harpoon:list():select(3) end,                     desc = "Goto file 3" },
      { "<leader>h4", function() harpoon:list():select(4) end,                     desc = "Goto file 4" },
      { "<leader>h[", function() harpoon:list():prev() end,                        desc = "Goto previous file" },
      { "<leader>h]", function() harpoon:list():next() end,                        desc = "Goto next file" }
    },

    {
      "<leader>l",
      group = "LSP",
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>",           desc = "Code Action" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>",                                 desc = "Info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>",                          desc = "Installer Info" },
      { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",          desc = "Next Diagnostic", },
      { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",          desc = "Prev Diagnostic", },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action" },
      { "<leader>lq", "<cmd>lua vim.diagnostic.set_loclist()<cr>",        desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", },
    },
    {
      "<leader>r",
      group = "Ruby",
      { "<leader>rt", "<cmd>TermExec direction=float cmd='bundle exec rspec %'<cr>", desc = "Test File" },
    },
    {
      "<leader>s",
      group = "Search",
      {
        "<leader>ss",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Search word under cursor"
      },
      {
        "<leader>st",
        function()
          local word = vim.fn.expand("<cWORD>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Search full under cursor"
      },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>sc", "<cmd>Telescope colorscheme<cr>",  desc = "Colorscheme" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",    desc = "Find Help" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",    desc = "Man Pages" },
      { "<leader>sr", "<cmd>Telescope oldfiles<cr>",     desc = "Open Recent File" },
      { "<leader>sR", "<cmd>Telescope registers<cr>",    desc = "Registers" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",      desc = "Keymaps" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",     desc = "Commands" },
    },
    {
      "<leader>x",
      group = "Trouble",

      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                                    desc = "Toggle Trouble" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",                       desc = "Buffer Diagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",                            desc = "Symbols" },
      { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right win.size=80<cr>", desc = "LSP Definitions / references" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                                        desc = "Location List" },
      { "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>",                                       desc = "Quickfix" },
      { "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>",                                 desc = "LSP References" },
    },
  }

  local wk = require("which-key")
  wk.add(mappings)
end

return M
