return {
  "Vigemus/iron.nvim",
  config = function()
    local view = require("iron.view")
    local iron = require("iron.core")
    iron.setup({
      config = {
        scratch_repl = true,
        repl_open_cmd = view.split.vertical.botright(0.5),
        repl_definition = {
          python = { command = "ipython", "--no-autoindent" },
        },
      },
      keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_until_cursor = "<space>su",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
  keys = {
    { "<space>rs", "<cmd>IronRepl<cr>" },
    { "<space>rr", "<cmd>IronRestart<cr>" },
    { "<space>rf", "<cmd>IronFocus<cr>" },
    { "<space>rh", "<cmd>IronHide<cr>" },
  },
}
