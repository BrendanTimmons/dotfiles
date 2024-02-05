local M = {
  "simrat39/rust-tools.nvim",
}

function M.config()
  require("rust-tools").setup()
end

return M

