-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    opts = {
      ensure_installed = {
        "lua_ls",
        "eslint", -- JS/TS lsp/linting
        "clangd", -- C++ LSP/Formatter https://clangd.llvm.org/features
        "ts_ls", -- TS/JS LSP
        "pyright", -- Python LSP
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd", -- html, css, js/ts, etc formatter | generally better/faster at formatting than eslint
        "cpplint", -- C/C++ linter according to Google C++ style guide https://github.com/cpplint/cpplint
        "flake8", -- python linter
        "autopep8", -- python formatter
         -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
