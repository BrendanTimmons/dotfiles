local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
}

function M.config()
  require("nvim-treesitter.configs")
end

return M

