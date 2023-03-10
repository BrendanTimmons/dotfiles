local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },
  })
end

return M
