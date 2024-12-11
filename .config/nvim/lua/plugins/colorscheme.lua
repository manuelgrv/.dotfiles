return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          rosewater = "#e5d7bd", -- Brighter beige
          flamingo = "#ef8c85", -- Slightly more vibrant red
          pink = "#ef8c85", -- More vivid pink
          mauve = "#ef8c85", -- More saturated mauve
          red = "#ef8c85", -- Enhanced red
          maroon = "#d45b51", -- Brighter red with a hint of warmth
          peach = "#f8be97", -- Slightly brighter peach
          yellow = "#e8c17c", -- Warm, brighter gold
          green = "#b1d176", -- More vibrant forest green
          teal = "#93d3a2", -- Brighter teal
          sky = "#89c7c0", -- Enhanced aqua blue
          sapphire = "#6aa39e", -- Richer teal tone
          blue = "#83c092", -- Brighter aqua
          lavender = "#e9d5b9", -- Light beige for highlights
          text = "#e9d5b9", -- Brighter main foreground
          subtext1 = "#b6d07f", -- Vibrant soft green for secondary text
          subtext0 = "#a0ada0", -- Slightly brighter muted gray
          overlay2 = "#96a398", -- Brighter gray for tertiary text
          overlay1 = "#69756e", -- Darker but enhanced muted gray
          overlay0 = "#57635b", -- Richer deep gray
          surface2 = "#435451", -- More vivid greenish-gray
          surface1 = "#3c4642", -- Slightly brighter background accent
          surface0 = "#2f3a38", -- Enhanced main surface color
          base = "#293235", -- Refined Everforest base
          mantle = "#242d30", -- Slightly brighter dark base
          crust = "#202729", -- Less dark crust background
        },
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
