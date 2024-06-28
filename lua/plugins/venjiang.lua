-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  -- astrocore
  {
    "AstroNvim/astrocore",
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          wrapscan = true, -- search wrap around
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
        },
      },
      mappings = {
        n = {
          ["<Leader>a"] = { "ggVG<cr>", desc = "Select all" },
          ["<Leader><cr>"] = { "<cmd>nohl<cr>", desc = "No highlight" },
          ["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<C-w>"] = { "<cmd>w!<cr>", desc = "Save" },
          ["<Leader>r"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
          ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- ["0"] = { "^" },
        },
        t = {
          ["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        },
      },
    },
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██╗   ██╗ ██████╗ ██╗      ██████╗ ",
        "╚██╗ ██╔╝██╔═══██╗██║     ██╔═══██╗",
        " ╚████╔╝ ██║   ██║██║     ██║   ██║",
        "  ╚██╔╝  ██║   ██║██║     ██║   ██║",
        "   ██║   ╚██████╔╝███████╗╚██████╔╝",
        "   ╚═╝    ╚═════╝ ╚══════╝ ╚═════╝ ",
      }
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  -- tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  -- twilight
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable" },
    keys = { { "<Leader>tw", "<cmd>Twilight<cr>", desc = "Twilight" } },
    opts = function() require("twilight").setup() end,
  },
  -- todo
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<Leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
      { "<Leader>tf", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      { "<Leader>tl", "<cmd>TodoLocList<cr>", desc = "Todo LocList" },
      { "<Leader>tq", "<cmd>TodoQuickFix<cr>", desc = "Todo QuickFix" },
    },
  },
  -- hop
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    keys = {
      { "<Leader>j", "<cmd>HopLine<cr>", desc = "Go to any line" },
      { "<Leader>w", "<cmd>HopWordCurrentLine<cr>", desc = "Go to any word current line" },
      { "<Leader>/", "<cmd>HopPattern<cr>", desc = "Search and go" },
      { "<Leader>q", "<cmd>HopWord<cr>", desc = "Go to any word in the current buffer" },
    },
    config = function() require("hop").setup() end,
  },
  -- git
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  -- diffview
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      { "<Leader>go", "<cmd>DiffviewOpen main<cr>", desc = "DiffviewOpen branch (main)" },
      { "<Leader>gO", "<cmd>DiffviewOpen master<cr>", desc = "DiffviewOpen branch (master)" },
      { "<Leader>gq", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        numhl = true,
        current_line_blame = true,
      }
    end,
    keys = {
      { "<Leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Git hunk" },
      { "<Leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Git hunk" },
      { "<Leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Git hunk" },
      { "<Leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle Git deleted" },
      { "<Leader>gW", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle Git word diff" },
      { "<Leader>gH", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle Git line highlight" },
      { "<Leader>gT", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle Git signs" },
      { "<Leader>gm", "<cmd>Gitsigns change_base main true<cr>", desc = "Change Git base (main)" },
      { "<Leader>ga", "<cmd>Gitsigns change_base master true<cr>", desc = "Change Git base (master)" },
      { "<Leader>gr", "<cmd>Gitsigns reset_base true<cr>", desc = "Reset Git base" },
    },
  },
  -- go
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  -- surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
  -- last place
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      }
    end,
  },
  -- ansible
  -- {
  --   "pearofducks/ansible-vim",
  --   ft = { "yaml.ansible" },
  -- },
  -- astrolsp
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     ---@diagnostic disable: missing-fields
  --     config = {
  --       -- ansiblels
  --       ansiblels = {
  --         settings = {
  --           ansible = {
  --             ansible = {
  --               useFullyQualifiedCollectionNames = false,
  --             },
  --             validation = {
  --               enabled = true,
  --               lint = {
  --                 enabled = false,
  --               },
  --             },
  --           },
  --         },
  --       },
  --       -- others
  --     },
  --   },
  -- },
  -- copilot
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   init = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --   end,
  --   keys = {
  --     {"<C-l>", 'copilot#Accept("<CR>")', mode="i", silent = true, expr = true, replace_keycodes = false },
  --     {"<C-j>", "copilot#Next()", mode="i", silent = true, expr = true },
  --     {"<C-k>", "copilot#Previous()", mode="i", silent = true, expr = true },
  --   },
  -- },
  -- others
}
