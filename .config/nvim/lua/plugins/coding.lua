return {
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = { "saghen/blink.compat" },
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
      keymap = {
        preset = "default",
        ["<C-y>"] = { "select_and_accept" },
      },
      sources = {
        default = { "obsidian", "obsidian_new", "obsidian_tags" },
        providers = {
          obsidian = {
            name = "obsidian",
            module = "blink.compat.source",
          },
          obsidian_new = {
            name = "obsidian_new",
            module = "blink.compat.source",
          },
          obsidian_tags = {
            name = "obsidian_tags",
            module = "blink.compat.source",
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        view = "cmdline_popup", -- Use a popup UI for the command-line
        format = {
          cmdline = { icon = ">" },
        },
      },
      presets = {
        command_palette = true, -- Enable command palette
      },
    },
  },
  {
    "terrortylor/nvim-comment",
    init = function()
      -- optional: leader-level mappings off if you don’t want them
      vim.g.nvim_comment_no_mappings = 0
    end,
    config = function()
      require("nvim_comment").setup({
        marker_padding = true, -- space after comment markers
        comment_empty = false, -- don’t comment empty lines
        comment_empty_trim_whitespace = true,
        create_mappings = true, -- `gcc`/`gc{motion}`
        line_mapping = "gcc",
        operator_mapping = "gc",
        hook = nil, -- custom pre-hook if needed
      })
    end,
    keys = { { "gcc", mode = { "n", "v" } }, { "gc", mode = { "n", "v" } } },
  },
}
