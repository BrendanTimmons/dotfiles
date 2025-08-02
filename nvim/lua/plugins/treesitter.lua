local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = false,
    },
  })
end

return M
