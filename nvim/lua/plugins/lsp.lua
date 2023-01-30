-- todo: this file is kinda gross
local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  event = "BufReadPost",
}

function M.config()
  require("plugins.lsp.handlers").setup()


  -- Mason

  local servers = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "bashls",
    "jsonls",
    "yamlls",
    "eslint",
  }

  local settings = {
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
  }

  require("mason").setup(settings)
  require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
  })
  require("mason-null-ls").setup({
    automatic_setup = true,
  })



  -- LSP Config

  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    return
  end

  local opts = {}

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


  -- Null-ls

  local null_ls = require("null-ls")

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    debug = false,
    sources = {
      formatting.prettier.with {
        -- extra_args = { "--no-config", "--print-width 120", "--trailing-comma all", "--single-quote"}
        -- filetypes = { "javascript","typescript","css","scss","json","yaml","markdown","graphql","md","txt","html", },
      },
      diagnostics.eslint
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })
end

return M
