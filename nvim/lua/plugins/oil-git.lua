local M = {
  "benomahony/oil-git.nvim",
  dependencies = { "stevearc/oil.nvim" },
  lazy = false
}

function M.config()
  require("oil-git").setup()
end

return M
