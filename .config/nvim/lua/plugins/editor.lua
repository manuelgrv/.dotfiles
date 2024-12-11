return {
  -- Neotree configuration
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

  -- TMUX jump between panes
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
    },
    opts = {
      workspaces = {
        {
          name = "kms",
          path = "~/kms",
        },
      },
      notes_subdir = "00_INBOX",
      new_notes_location = "notes_subdir",
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
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
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
      { "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New note from template" },
      { "<leader>of", "<cmd>ObsidianSearch<cr>", desc = "Find notes" },
      { "<leader>opi", "<cmd>ObsidianPasteImage<cr>", desc = "Paste image in note" },
      { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note in current buffer" },
    },
  },
}
