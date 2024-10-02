-- Customize Treesitter

return {
  ---@type LazySpec
  require("nvim-treesitter.configs").setup {
    -- add more arguments for more TS parsers
    ensure_installed = { "lua", "vim", "html", "css" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
