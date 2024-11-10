return {
  { "microsoft/python-type-stubs" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
            return capabilities
          end)(),
          settings = {
            basedpyright = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  reportShadowedImports = "warning",
                },
                typeCheckingMode = "off",
                autoSearchPaths = true,
                stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs"),
              },
            },
          },
        },
      },
    },
  },
}
