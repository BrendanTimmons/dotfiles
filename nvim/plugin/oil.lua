vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
})

local opts = {
  float = {
    padding = 5,
    max_width = 0.8,
    border = "rounded",
  },
  view_options = {
    show_hidden = true,
  },
}

require("oil").setup(opts)

vim.keymap.set("n", "<leader>o", "<cmd>Oil --float --preview<CR>", {desc = "Oil"})
