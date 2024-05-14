return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparent_background = not vim.g.neovide,
    integrations = {
      cmp = true,
      dashboard = true,
      dap = true,
      dap_ui = true,
      flash = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = "lavendar", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      neotree = false,
      telescope = { enabled = true },
      treesitter = true,
      notify = false,
      mason = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },
}
