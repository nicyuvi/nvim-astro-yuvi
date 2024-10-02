-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local lazy = require "lazy"
      local banners = require "banners"

      local function pick_color()
        local colors = { "String", "Identifier", "Keyword", "Number" }
        return colors[math.random(#colors)]
      end

      local function footer()
        local total_plugins = lazy.stats().count
        local datetime = os.date " %d-%m-%Y   %H:%M:%S"
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

        return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
      end

      require("alpha").setup {
        opts = {
          noautocmd = true,
        },
        layout = {
          {
            -- current header takes up 36 lines max
            -- dynamic padding based on that
            type = "text",
            val = function()
              local pad = {}
              for _ = 1, ((vim.o.lines - 45) / 2) do
                table.insert(pad, "")
              end
              return pad
            end,
          },
          {
            type = "text",
            opts = {
              position = "center",
              hl = "Number",
            },
            val = banners.greymon_crop,
          },
          {
            type = "text",
            val = footer(),
            opts = {
              position = "center",
              hl = "DashboardFooter",
            },
          },
          {
            type = "padding",
            val = 2,
          },
          {
            type = "text",
            val = "· · ─ ·☽𖤓☾· ─ · · ⛧☾༺♰༻☽⛧  ⟢ Nova Flame ⟢ ⛧☾༺♰༻☽⛧ · · ─ ·☽𖤓☾· ─ · ·",
            opts = {
              position = "center",
              hl = "DashboardFooter",
            },
          },
        },
      }
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(cond.none())
          -- don't delete if the next character is xx
              :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
              :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
