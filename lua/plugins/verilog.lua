return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "verible",
        "svlangserver",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          cmd = { "verible-verilog-ls" },
          filetypes = { "verilog", "systemverilog" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("verible.filelist", ".git")(fname) or vim.loop.cwd()
          end,
        },
        svlangserver = {
          cmd = { "svlangserver" },
          filetypes = { "verilog", "systemverilog" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".svlangserver", ".git")(fname) or vim.loop.cwd()
          end,
          settings = {
            systemverilog = {
              includeIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}" },
            },
          },
          single_file_support = true,
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
