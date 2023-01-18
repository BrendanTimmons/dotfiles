local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  require("catppuccin").setup({
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
      comments = { "italic" },
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
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      bufferline = true,
      mason = true,
      treesitter = true,
      lsp_trouble = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    },
  })

  vim.cmd.colorscheme "catppuccin"

  -- also set transparent backgound + float windows (neon_transparent doesn't do this)
  -- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return M
