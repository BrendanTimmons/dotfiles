vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    width = 60,
    sections = {
      -- {
      --   section = "terminal",
      --   cmd =
      --   "chafa ~/.config/wall.png --probe off --format symbols --symbols vhalf --size 24x12; sleep .1",
      --   height = 12,
      --   width = 24,
      --   padding = 1,
      --   indent = 18
      -- },
      -- {
      --   section = "terminal",
      --   cmd = "echo '\x1b[33mKlanq puff at you?'",
      --   height = 1,
      --   padding = 1,
      --   width = 24,
      --   indent = 18
      -- },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  input = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
})

-- Snacks keymaps
vim.keymap.set("n", "<leader>a", function() Snacks.dashboard() end, { desc = "Dashboard" })

-- Top Pickers
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })

-- find
vim.keymap.set("n", "<leader>C", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config File" })
vim.keymap.set("n", "<C-P>", function() Snacks.picker.files() end, { desc = "Find Files" })

-- git
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gB", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "LazyGit" })

-- Grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<C-F>", function() Snacks.picker.grep() end, { desc = "Grep" })

-- search
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.projects() end, { desc = "Projects" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.lazy() end, { desc = "Search for Lazy Plugin Spec" })

-- LSP
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References", nowait = true })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ls", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end,
  { desc = "LSP Workspace Symbols" })

-- LSP Progress notification
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
