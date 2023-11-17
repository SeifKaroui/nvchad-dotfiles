local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    commit = "33eb472",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Tmux
  { "christoomey/vim-tmux-navigator", lazy = false },

  { "wakatime/vim-wakatime", lazy = false },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    lazy = false,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
      },
    },
    opts = require "custom.configs.conform",
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function(_, opts)
      require("core.utils").load_mappings "trouble"
    end,
  },
}

return plugins
