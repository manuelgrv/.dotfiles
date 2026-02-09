return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = true,
      render_modes = true,
      heading = { enabled = false },
      html = { comment = { conceal = false } },
      checkbox = {
        enabled = true,
        right_pad = 1,
        unchecked = {
          icon = "󰄱",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = "",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "@markup.strikethrough",
        },
        custom = {
          blocked = { raw = "[~]", rendered = "󰰱", highlight = "RenderMarkdownError", scope_highlight = nil },
          important = { raw = "[!]", rendered = "", highlight = "RenderMarkdownWarn", scope_highlight = nil },
          todo = { raw = "[>]", rendered = "", highlight = "RenderMarkdownHint", scope_highlight = nil },
        },
      },
      bullet = {
        enabled = true,
        icons = { "•", "•", "•", "•" },
        highlight = "RenderMarkdownHint",
      },
    },
  },
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    enabled = true,
    build = false,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
      },
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          only_render_image_at_cursor_mode = "inline",
        },
      },
      max_width = nil,
      max_height = 16,
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = {
      renderer_options = {
        mermaid = {
          theme = "dark",
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
      window = {
        position = "right",
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>y",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>yw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "kms",
          path = "~/kms",
        },
      },
      notes_subdir = "00-INBOX",
      new_notes_location = "notes_subdir",
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      preferred_link_style = "wiki",
      completion = {
        blink = true,
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end
        local out = {
          created_at = os.date("!%Y-%m-%d"),
          aliases = note.aliases,
          id = note.id,
          reviewed_at = os.date("!%Y-%m-%d"),
          source = note.metadata and note.metadata.sources or {},
          tags = note.tags or {},
          title = note.title,
        }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
      note_creation_func = function(note)
        local frontmatter = note:to_frontmatter() -- Converts frontmatter to YAML format
        local title = "# " .. (note.title or "Untitled") -- Add the title as an H1 header
        local body = note.body or "" -- Preserve any existing body content

        -- Combine frontmatter, title, and body
        local content = table.concat({ frontmatter, "", title, "", body }, "\n")
        return content
      end,
      follow_img_func = function(img)
        vim.fn.jobstart({ "qlmanage", "-p", img })
      end,
      image_name_func = function()
        return string.format("%s-img", os.time())
      end,
      attachments = {
        img_folder = "attachments",
        confirm_img_paste = false,
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
      { "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New note from template" },
      { "<leader>of", "<cmd>ObsidianSearch<cr>", desc = "Find notes" },
      { "<leader>oi", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image in note" },
      { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note in current buffer" },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- HACK: fix error, disable completion.nvim_cmp option, manually register sources
      local cmp = require("cmp")
      cmp.register_source("obsidian", require("cmp_obsidian").new())
      cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
      cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
    end,
  },
}
