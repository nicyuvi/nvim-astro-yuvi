-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Some builtins were removed https://github.com/nvimtools/none-ls.nvim/discussions/81
    -- check out more here: https://github.com/nvimtools/none-ls-extras.nvim
    -- i.e. deleted: diagnostics/cpplint.lua (use clangd / available in none-ls-extras.nvim)

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      null_ls.builtins.formatting.prettierd,
      require("none-ls.diagnostics.eslint_d").with(
        {
           filetypes = {
             "javascript",
             "typescript",
             "javascriptreact",
             "typescriptreact",
             "html", -- angular templates
          },
        }
      ),
      require "none-ls.code_actions.eslint_d",
      require "none-ls.formatting.eslint_d", -- if we want prettier to format, use eslintConfigPrettier
      require "none-ls.diagnostics.cpplint",
    })
  end,
}
