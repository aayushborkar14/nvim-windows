return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "verible",
        "svls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svls = {
          cmd = { "svls" },
          filetypes = { "verilog", "systemverilog" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.loop.cwd()
          end,
        },
        verible = {
          cmd = { "verible-verilog-ls" },
          filetypes = { "verilog", "systemverilog" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("verible.filelist", ".git")(fname) or vim.loop.cwd()
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["verilog"] = { "verible" },
        ["systemverilog"] = { "verible" },
      },
    },
  },
}
