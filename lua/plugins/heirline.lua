return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    -- You can store the TypeScript version here
    vim.b.ts_version = vim.b.ts_version or "Not Available"

    -- Function to fetch Node.js version, returns nil if not found
    local function get_node_version()
      local node_version = vim.fn.system("node -v"):gsub("\n", "") -- Remove newline
      if node_version ~= "" then
        vim.b.node_version = node_version
      else
        vim.b.node_version = nil
      end
      return vim.b.node_version
    end

    -- Heirline Node.js version component, will only show if node_version and ts_version are both available
    local node_version_component = {
      provider = function()
        -- Only show Node.js version if TypeScript version is available
        if vim.b.ts_version and get_node_version() then
          return "Node: " .. vim.b.node_version
        else
          return ""
        end
      end,
      hl = { fg = "#32CD32", bg = "bg", bold = true }, -- Green text
      padding = { left = 1, right = 1 },
    }

    local typescript_version_component = {
      provider = function() return vim.b.ts_version and "TS: " .. vim.b.ts_version end,
      hl = { fg = "#4FC1FF", bg = "bg" },
      padding = { left = 1, right = 1 },
    }

    local space = { provider = " ", hl = { bg = "bg" } }

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
      space,
      node_version_component,
      space,
      typescript_version_component,
      -- Add TypeScript version display after LSP
      status.component.nav(),
    }
  end,
}
