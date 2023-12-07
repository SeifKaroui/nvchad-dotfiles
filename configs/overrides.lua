local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
    -- "dart",
    "python",
    -- Svelte
    "svelte",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",

    "prettierd",
    "prettier",
    "svelte-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- Go
    -- "gopls",
    --
    -- Rust
    "rust-analyzer",
    "rustfmt",

    -- Python
    "pyright",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = false,
      },
    },
  },
}

return M
