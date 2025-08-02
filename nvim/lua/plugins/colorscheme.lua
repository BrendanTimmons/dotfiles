local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
      transparent = true,          -- enable transparent floating windows
      solid = false,               -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false,             -- dims the background color of inactive window
    },
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },     -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = true,
  })

  vim.cmd.colorscheme "catppuccin"
end

return M
