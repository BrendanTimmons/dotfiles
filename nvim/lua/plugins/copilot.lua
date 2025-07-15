local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {}
}

function M.config()
  local copilot = require("copilot")

  copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = true, auto_refresh = true },
  })
end

return M
