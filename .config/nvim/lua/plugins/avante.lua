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
    disabled_tools = {
      "delete_path",
      "move_path",
      "bash",
      "git_commit",
    },
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-5",
        timeout = 60000,
        extra_request_body = {
          temperature = 0.2,
          reasoning_effort = "medium",
          max_completion_tokens = 16384,
        },
      },
      openai_mini = {
        __inherited_from = "openai",
        model = "gpt-5-mini",
        extra_request_body = {
          temperature = 0.2,
          reasoning_effort = "low",
          max_completion_tokens = 8192,
        },
      },
      openai_nano = {
        __inherited_from = "openai",
        model = "gpt-5-nano",
        extra_request_body = {
          temperature = 0.2,
          reasoning_effort = "low",
          max_completion_tokens = 4096,
        },
      },
    },
    windows = {
      ask = {
        floating = false,
        start_insert = false,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Common Lua utilities used by many plugins
    "MunifTanjim/nui.nvim", -- UI components used by Avante
    "nvim-telescope/telescope.nvim", -- Fuzzy finder integration (optional)
  },
}
