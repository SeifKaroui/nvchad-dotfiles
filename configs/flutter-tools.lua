local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- Setup telescope integration
require("telescope").load_extension "flutter"
local options = {
  decorations = {
    statusline = {
      device = true,
    },
  },
  lsp = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      -- require("core.utils").load_mappings "flutter_tools"
    end,
    capabilities = capabilities,
  },
}

return options
