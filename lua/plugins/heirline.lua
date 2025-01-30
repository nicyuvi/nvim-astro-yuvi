return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    -- using globals so we add some error hints if not available
    vim.b.ts_version = vim.b.ts_version or "ts_version not available"
    vim.b.node_version = vim.b.node_version or "node_version not available"
    vim.b.python_version = vim.b.python_version or "python_version not available"

    local typescript_version_component = {
      provider = function() return vim.b.ts_version and "TS: " .. vim.b.ts_version end,
      hl = { fg = "#4FC1FF", bg = "bg" },
      padding = { left = 1, right = 1 },
    }

    local node_version_component = {
      provider = function() return vim.b.node_version and "Node: " .. vim.b.node_version end,
      hl = { fg = "#32CD32", bg = "bg", bold = true },
      padding = { left = 1, right = 1 },
    }

    local python_version_component = {
      provider = function() return vim.b.python_version end,
      hl = { fg = "#FFD700", bg = "bg", bold = true },
      padding = { left = 1, right = 1 },
    }

    local space = { provider = " ", hl = { bg = "bg" } }

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      },
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      space,
      node_version_component,
      space,
      typescript_version_component,
      space,
      python_version_component,
      status.component.nav(),
    }
  end,
}
