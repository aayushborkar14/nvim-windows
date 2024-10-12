-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use PowerShell as the shell
vim.o.shell = "pwsh"
vim.o.shellquote = ""
vim.o.shellxquote = ""
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'

-- Pumblend and Winblend for transparency
vim.o.pumblend = 0
vim.o.winblend = 0

-- Use fzf-lua
vim.g.lazyvim_picker = "fzf"

-- Use basedpyright as the default Python LSP, and the new ruff
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Use the treesitter foldexpr for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Neovide config
if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h12"
end
