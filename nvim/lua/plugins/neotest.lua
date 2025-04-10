local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- adapters
    "marilari88/neotest-vitest"
  },
}

function M.config()
  local neotest = require("neotest")

  neotest.setup({
    adapters = {
      require("neotest-vitest"),
    }
  })
end

return M
