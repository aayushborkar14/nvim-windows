return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      template_file = {
        cpp = "C:\\Users\\aayus\\Documents\\codeforces\\template.cpp",
      },
      compile_command = {
        c = { exec = "gcc", args = { "-Wall", "-g", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-Wall", "-g", "$(FNAME)", "-o", "$(FNOEXT)" } },
        rust = { exec = "rustc", args = { "$(FNAME)" } },
        java = { exec = "javac", args = { "$(FNAME)" } },
      },
    })
  end,
  keys = {
    { "<leader>ctt", "<cmd>CompetiTest receive testcases<cr>", desc = "Receive testcases" },
    { "<leader>ctp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive problems" },
    { "<leader>ctc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive contest" },
    { "<leader>ctr", "<cmd>CompetiTest run<cr>", desc = "Run testcases" },
  },
}
