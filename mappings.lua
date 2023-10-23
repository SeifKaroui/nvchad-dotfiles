---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window up" },
  },
}
M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}
-- more keybinds!
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.rust_tools = {
  plugin = true,
  n = {
    ["<leader>rie"] = {
      function()
        require("rust-tools").inlay_hints.enable()
      end,
      "Enable inlay hints auto update and set them for all the buffers",
    },
    ["<leader>rid"] = {
      function()
        require("rust-tools").inlay_hints.disable()
      end,
      "Enable inlay hints auto update and set them for all the buffers",
    },
    ["<leader>ris"] = {
      function()
        require("rust-tools").inlay_hints.set()
      end,
      "Set inlay hints for the current buffer",
    },
    ["<leader>riu"] = {
      function()
        require("rust-tools").inlay_hints.unset()
      end,
      "require('rust-tools').inlay_hints.unset()",
    },
    ["<leader>rr"] = {
      function()
        require("rust-tools").runnables.runnables()
      end,
      "RustRunnables",
    },
    ["<leader>rem"] = {
      function()
        require("rust-tools").expand_macro.expand_macro()
      end,
      "RustExpandMacro",
    },
    ["<leader>rha"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "RustHoverActions",
    },
    ["<leader>roc"] = {
      function()
        require("rust-tools").open_cargo_toml.open_cargo_toml()
      end,
      "RustHoverActions",
    },
  },
}
-- M.flutter_tools = {
--   plugin = true,
--   n = {
--     ["<leader>fru"] = {
--       "<cmd> FlutterRun <CR>",
--       "FlutterRun",
--     },
--     ["<leader>fd"] = {
--       "<cmd> FlutterDevices <CR>",
--       "FlutterDevices",
--     },
--     ["<leader>fe"] = {
--       "<cmd> FlutterEmulators <CR>",
--       "FlutterEmulators",
--     },
--     ["<leader>fre"] = {
--       "<cmd> FlutterReload <CR>",
--       "FlutterReload",
--     },
--     ["<leader>frs"] = {
--       "<cmd> FlutterRestart<CR>",
--       "FlutterRestart",
--     },
--     ["<leader>frn"] = {
--       "<cmd> FlutterRename<CR>",
--       "FlutterRename",
--     },
--   },
-- }
M.trouble = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<cr>",
      "TroubleToggle",
      opts = { silent = true },
    },
    ["<leader>tw"] = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Toggle Workspace Diagnostics",
      opts = { silent = true, noremap = true },
    },
    ["<leader>td"] = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Toggle Documents Diagnostics",
      opts = { silent = true, noremap = true },
    },
    ["<leader>tl"] = {
      "<cmd>TroubleToggle loclist<cr>",
      "Toggle loclist",
      opts = { silent = true, noremap = true },
    },
    ["<leader>tq"] = {
      "<cmd>TroubleToggle quickfix<cr>",
      "Toggle QuickFix",
      opts = { silent = true, noremap = true },
    },
    ["gR"] = {
      "<cmd>TroubleToggle lsp_references<cr>",
      "Toggle LSP References",
      opts = { silent = true, noremap = true },
    },
  },
}
return M
