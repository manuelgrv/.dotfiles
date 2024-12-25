return {
  {
    "saghen/blink.cmp",
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
