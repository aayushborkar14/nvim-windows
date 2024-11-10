return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparent_background = not vim.g.neovide,
    integrations = {
      neotree = true,
      notify = true,
      mason = true,
    },
  },
}
