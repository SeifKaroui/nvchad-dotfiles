local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript" }, extra_filetypes = { "svelte" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Rust
  b.formatting.rustfmt,

  -- Dart
  b.formatting.dart_format,

  -- Go
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.goimports_reviser,
  null_ls.builtins.formatting.golines,

  -- Python
  b.formatting.autoflake,
  b.formatting.autopep8,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
