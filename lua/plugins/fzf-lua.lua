return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fz", "<cmd>FzfLua<cr>", desc = "FzfLua" },
    { "<leader>fzf", "<cmd>FzfLua files<cr>", desc = "FzfLua files" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
}
