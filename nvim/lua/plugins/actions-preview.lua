return {
  "aznhe21/actions-preview.nvim",
  keys = {
    {
      "<leader>.",
      function()
        require("actions-preview").code_actions()
      end,
      desc = "Code [A]ction",
    },
  },
  opts = {
    telescope = {
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = "top",
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    }
  }
}
