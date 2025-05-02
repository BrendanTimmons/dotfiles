return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>w",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    local jsConf = { "prettier" }

    require("conform").setup({
      formatters_by_ft = {
        javascript = jsConf,
        typescript = jsConf,
        javascriptreact = jsConf,
        typescriptreact = jsConf,
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback"
      }
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
