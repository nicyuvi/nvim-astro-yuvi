return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    -- You can store the TypeScript version here
    vim.b.ts_version = vim.b.ts_version or "Not Available"

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      -- Add TypeScript version display after LSP
      {
        provider = function() return vim.b.ts_version and "TS: " .. vim.b.ts_version end,
        hl = { fg = "#4FC1FF", bg = "bg" },
        padding = { left = 1, right = 1 },
      },
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
    }
  end,
}
