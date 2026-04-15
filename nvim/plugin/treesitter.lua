vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context", },
})
local ts_parsers = {
  "bash",
  "dockerfile",
  "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
  "go", "gomod", "gosum",
  "json", "toml", "yaml",
  "lua",
  "make",
  "markdown",
  "python",
  "terraform",
  "vim", "vimdoc",
}

local nts = require("nvim-treesitter")
nts.install(ts_parsers)
vim.api.nvim_create_autocmd('PackChanged', { 
    callback = function()
        nts.update()
    end
})

require("treesitter-context").setup({
  max_lines = 3,
  multiline_threshold = 1,
  separator = '-',
  min_window_height = 20,
  line_numbers = true,
})

-- enable treesitter highlighting and indents
vim.api.nvim_create_autocmd("FileType", { 
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end
})
