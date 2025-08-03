return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      width = 60,
      sections = {
        {
          section = "terminal",
          cmd =
          "chafa ~/.config/wall.png --probe off --format symbols --symbols vhalf --size 24x12; sleep .1",
          height = 12,
          width = 24,
          padding = 1,
          indent = 18
        },
        {
          section = "terminal",
          cmd = "echo '\x1b[33mKlanq puff at you?'",
          height = 1,
          padding = 1,
          width = 24,
          indent = 18
        },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    { "<leader>a",       function() Snacks.dashboard() end,                                      desc = "Dashboard" },

    -- Top Pickers
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },

    -- find
    { "<leader>C",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<C-P>",           function() Snacks.picker.files() end,                                   desc = "Find Files" },

    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gB",      function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "LazyGit" },

    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<C-F>",           function() Snacks.picker.grep() end,                                    desc = "Grep" },

    -- search
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },

    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          desc = "References",            nowait = true },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ls",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>lS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  },
  init = function()
    -- LSP Progress notification
    vim.api.nvim_create_autocmd("LspProgress", {
      callback = function(ev)
        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(vim.lsp.status(), "info", {
          id = "lsp_progress",
          title = "LSP Progress",
          opts = function(notif)
            notif.icon = ev.data.params.value.kind == "end" and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}
