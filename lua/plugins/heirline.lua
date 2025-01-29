return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    -- You can store the TypeScript version here
    vim.b.ts_version = vim.b.ts_version or "Not Available"

    -- Function to fetch Node.js version
    local function get_node_version()
      local node_version = vim.fn.system("node -v"):gsub("\n", "") -- Remove newline
      vim.b.node_version = node_version ~= "" and node_version or "N/A"
      return vim.b.node_version
    end

    -- Heirline Node.js version component
    local node_version_component = {
      provider = function() return "Node: " .. (vim.b.node_version or get_node_version()) end,
      hl = { fg = "#32CD32", bg = "bg", bold = true }, -- Green text
      padding = { left = 1, right = 1 },
    }

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
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      -- Space
      { provider = " ", hl = { bg = "bg" } },
      -- Add Node.js version component
      node_version_component,
      -- Space
      { provider = " ", hl = { bg = "bg" } },
      -- Add TypeScript version display after LSP
      {
        provider = function() return vim.b.ts_version and "TS: " .. vim.b.ts_version end,
        hl = { fg = "#4FC1FF", bg = "bg" },
        padding = { left = 1, right = 1 },
      },
      status.component.nav(),
    }
  end,
}
