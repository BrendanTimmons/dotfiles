local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",
  }
}

function M.config()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

  -- enable mason and configure icons
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "cssls",
      "yamlls",
      "tailwindcss",
    },
  })

  mason_tool_installer.setup({
    ensure_installed = {
      "prettierd",
      "stylua",
      "eslint_d",
      "yamllint",
    },
  })
end

return M
