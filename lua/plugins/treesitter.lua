-- Customize Treesitter
vim.opt.runtimepath:append "$HOME/.local/share/treesitter"

return {
  ---@type LazySpec
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup {
    parser_install_dir = "$HOME/.local/share/treesitter",
    ensure_installed = { "lua", "vim", "html", "css", "jsonc", "typescript" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
