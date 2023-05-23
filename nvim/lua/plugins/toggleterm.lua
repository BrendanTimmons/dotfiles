return {
  "akinsho/toggleterm.nvim",
  event = "VimEnter",
  config = true,
  opts = {
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
  },
}
