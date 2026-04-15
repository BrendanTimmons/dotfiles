local M = {
  'dmmulroy/ts-error-translator.nvim',
  event = "VeryLazy",
  opts = {
    auto_override_publish_diagnostics = true,
  }
}

function M.config()
  require("ts-error-translator").setup()
end

return M
