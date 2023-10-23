local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require("core.utils").load_mappings "rust_tools"
    end,
    capabilities = capabilities,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
}

return options
