---@type LazySpec
return {
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>gy",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager",
      },
      -- {
      --   "<leader>-",
      --   mode = { "n", "v" },
      --   "<cmd>Yazi<cr>",
      --   desc = "Open yazi at the current file",
      -- },
      {
        -- Open in the current working directory
        "<leader>gY",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   "<c-up>",
      --   "<cmd>Yazi toggle<cr>",
      --   desc = "Resume the last yazi session",
      -- },
      -- {
      --   -- Open in the current working directory
      --   "<leader>E",
      --   "<cmd>Yazi cwd<cr>",
      --   desc = "Open the file manager in nvim's working directory",
      -- },
      -- {
      --   -- Open in the current working directory
      --   "<leader><space>",
      --   function()
      --     require("yazi").yazi(nil, vim.fn.getcwd())
      --   end,
      --   desc = "Open the file manager in nvim's working directory",
      -- },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = false,
      keymap = {
        open = "<leader>e",
        open_cwd = "<leader>E",
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      bigfile = {
        enabled = true,
      },
      picker = {
        exclude = {
          -- ".git",
          "node_modules",
          ".cache",
          "dist",
          ".next",
          "tmp"
        },

        grep = {},
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "node_modules",
              ".cache/*",
            },
          },
        },
      },
      dashboard = { enabled = true },
      words = { enabled = true },
      input = { enabled = true },
      explorer = {
        hidden = true,
        ignored = true,
        enabled = true,
      },
      scratch = {
        enabled = true,
        win = {
          style = "scratch",
          width = 100,
          height = 30,
          bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
          minimal = false,
          noautocmd = false,
          -- position = "right",
          zindex = 20,
          wo = { winhighlight = "NormalFloat:Normal" },
          border = "rounded",
          title_pos = "center",
          footer_pos = "center",
        },
      },
      image = {
        enabled = true,
        math = {
          enabled = true, -- enable math expression rendering
          latex = {
            font_size = "small",
          },
        },
        doc = {
          -- enable image viewer for documents
          -- a treesitter parser must be available for the enabled languages.
          enabled = true,
          -- render the image inline in the buffer
          -- if your env doesn't support unicode placeholders, this will be disabled
          -- takes precedence over `opts.float` on supported terminals
          inline = true,
          -- render the image in a floating window
          -- only used if `opts.inline` is disabled
          float = true,
          max_width = 80,
          max_height = 40,
          -- Set to `true`, to conceal the image text when rendering inline.
          -- (experimental)
          ---@param lang string tree-sitter language
          ---@param type snacks.image.Type image type
          conceal = function(lang, type)
            -- only conceal math expressions
            return type == "math"
          end,
        },
      },
    },
    keys = {
      {
        "<leader>k",
        function()
          Snacks.image.hover()
        end,
        desc = "Hover image",
      },
    },
  }
}
