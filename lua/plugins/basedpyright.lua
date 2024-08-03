return {
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
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedVariable = false, -- or anything
              },
              typeCheckingMode = "basic",
              autoSearchPaths = true,
            },
          },
        },
      },
    },
  },
}
