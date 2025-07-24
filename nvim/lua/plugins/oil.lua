return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  keys = {
    { "<leader>o", "<cmd>Oil<CR>", desc = "Oil" },
  },
  lazy = false,
  config = function()
    require("oil").setup()
  end
}
