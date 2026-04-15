local M = {
	"stevearc/oil.nvim",
	opts = {
		float = {
			padding = 5,
			max_width = 0.8,
			border = "double",
		},
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>o", "<cmd>Oil --float --preview<CR>", desc = "Oil float" },
		{ "<leader>O", "<cmd>Oil --preview<CR>", desc = "Oil" },
	},
	lazy = false,
}

function M.config()
	require("oil").setup(M.opts)
end

return M
