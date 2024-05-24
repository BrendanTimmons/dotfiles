local M = {
  "akinsho/toggleterm.nvim",
  event = "VimEnter",
}

function M.config()
  local toggleterm = require("toggleterm")
  toggleterm.setup({
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    direction = "float",
    float_opts = {
      border = "curved",
      winblend = 0,
      width = 180,
      height = 40,
      highlights = {
        border = "Normal",
        background = "Normal"
      }
    }
  })

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    hide_numbers = true,
    direction = "float",
    float_opts = {
      border = "curved",
      winblend = 0,
      width = 220,
      height = 50,
      highlights = {
        border = "Normal",
        background = "Normal"
      }
    }
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
end

return M
