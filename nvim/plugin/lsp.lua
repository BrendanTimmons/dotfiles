vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({
  ui = {
    border = "double",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

vim.lsp.enable({
  "bashls",
  "lua_ls",
  "ts_ls",
  "eslint",
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
  },
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
})

vim.lsp.inlay_hint.enable()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', 'K', function() vim.lsp.buf.hover({border = 'rounded'}) end, 'LSP Hover')
    map('n', '<C-k>', function() vim.lsp.buf.signature_help({border = 'rounded'}) end, 'Signature Help')
    map('n', '[d', function() vim.diagnostic.jump({ border = "rounded", count = -1 }) end, 'Previous Diagnostic')
    map('n', ']d', function() vim.diagnostic.jump({ border = "rounded", count = 1 }) end, 'Next Diagnostic')
  end,
})
