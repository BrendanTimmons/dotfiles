return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "j-hui/fidget.nvim",
  },
  event = "BufReadPost",
  config = function()
    local servers = {
      "lua_ls",
      "cssls",
      "html",
      "vtsls",
      "bashls",
      "jsonls",
      "yamlls",
      "eslint_d",
      "tailwindcss",
      "spectral"
    }

    require("plugins.lsp.handlers").setup()

    require("mason").setup({
      ui = {
        border = "none",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    })

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })


    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

    if not lspconfig_status_ok then
      return
    end

    local opts = {}

    -- load all servers in the servers table above
    for _, server in pairs(servers) do
      opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
      }
      server = vim.split(server, "@")[1]
      local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
      end
      lspconfig[server].setup(opts)
    end
  end
}
