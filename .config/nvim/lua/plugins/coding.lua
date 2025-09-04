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
}
