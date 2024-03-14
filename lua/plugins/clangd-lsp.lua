return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    table.insert(opts.servers.clangd.cmd, "--query-driver=C:\\Users\\aayus\\mingw64\\bin\\g++.exe")
  end,
}
