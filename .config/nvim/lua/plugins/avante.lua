return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- Path to a markdown file with predefined instructions/prompts used by Avante
    instructions_file = "avante.md", -- Path to a markdown file with predefined instructions/prompts used by Avante
    provider = "openai",
    providers = {
      openai = {
        model = "gpt-5-2025-08-07",
        timeout = 30000,
        extra_request_body = {
          temperature = 1, -- Higher = more creative; lower = more deterministic
        },
      },
      ["opena_ai_mini"] = {
        __inherited_from = "openai", -- Reuse unspecified fields from 'openai'
        model = "gpt-5-mini-2025-08-07", -- Smaller/faster/cheaper variant
        timeout = 30000,
        extra_request_body = {
          temperature = 1,
        },
      },
      ["opena_ai_nano"] = {
        __inherited_from = "openai",
        model = "gpt-5-nano-2025-08-07", -- Even smaller/faster variant
        timeout = 30000,
        extra_request_body = {
          temperature = 1,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Common Lua utilities used by many plugins
    "MunifTanjim/nui.nvim", -- UI components used by Avante
    "nvim-telescope/telescope.nvim", -- Fuzzy finder integration (optional)
  },
}
