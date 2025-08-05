local M = {
  "BrendanTimmons/resheph.nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  vim.cmd.colorscheme "resheph"
end

return M
