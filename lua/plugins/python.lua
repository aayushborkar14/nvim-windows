return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers["pyright"] = {}
      opts.servers["pyright"].enabled = false
      opts.servers["basedpyright"] = {}
      opts.servers["basedpyright"].enabled = false
      opts.servers["ruff"] = {}
      opts.servers["ruff"].enabled = false
      opts.servers["ruff-lsp"] = {}
      opts.servers["ruff-lsp"].enabled = false
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- rope_autoimport = { enabled = true },
                ruff = { enabled = true, format = {
                  "I",
                } },
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "python-lsp-server" } },
  },
}
