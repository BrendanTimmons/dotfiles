local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>ha", function() harpoon:list():add() end,     desc = "Add file to Harpoon" },
      {
        "<leader>hh",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list(),
            { border = "rounded", title_pos = "center" })
        end,
        desc = "Toggle Harpoon menu"
      },
      { "<leader>hj", function() harpoon:list():prev() end,    desc = "Next Harpoon file" },
      { "<leader>hk", function() harpoon:list():next() end,    desc = "Previous Harpoon file" },
      { "<leader>h1", function() harpoon:list():select(1) end, desc = "Open file 1" },
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "Open file 2" },
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "Open file 3" },
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "Open file 4" },
    }
  end,
}

M.config = function()
  require("harpoon").setup(M.opts)
end

return M
