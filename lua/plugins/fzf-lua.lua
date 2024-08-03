return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fzf", "<cmd>FzfLua files<cr>", desc = "FzfLua files" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
}
