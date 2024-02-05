local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "VimEnter"
}

function M.config()
  local harpoon = require("harpoon")
  harpoon:setup({})

  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end

  vim.keymap.set("n", "<S-E>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

  vim.keymap.set("n", "<leader>r", function() harpoon:list():append() end)
  vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<leader>[", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<leader>]", function() harpoon:list():next() end)
end

return M
