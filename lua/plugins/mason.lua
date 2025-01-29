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
        "jsonls", -- json lsp for settings files and such
        -- "eslint", -- JS/TS lsp/linting | stopped working -- switched to eslint_d through none_ls
        "clangd", -- C++ LSP/Formatter https://clangd.llvm.org/features
        "ts_ls", -- TS/JS LSP
        "tailwindcss", -- tailwind lsp
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
        -- "prettierd", -- doesn't work with prettier-plugin-tailwindcss
        "prettier", -- faster at formatting than eslint. uses local install prettier
        "eslint_d", -- ts/js linter -- use prettier for formatting
        "cpplint", -- C/C++ linter according to Google C++ style guide https://github.com/cpplint/cpplint
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
