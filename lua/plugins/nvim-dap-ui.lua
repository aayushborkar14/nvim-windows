return {
  "rcarriga/nvim-dap-ui",
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
  opts = {},
  config = function(_, opts)
    -- setup dap config by VsCode launch.json file
    -- require("dap.ext.vscode").load_launchjs()
    local dap = require("dap")
    local dapui = require("dapui")
    opts.layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.85,
          },
          {
            id = "breakpoints",
            size = 0.05,
          },
          {
            id = "stacks",
            size = 0.05,
          },
          {
            id = "watches",
            size = 0.05,
          },
        },
        position = "left",
        size = 40,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.4,
          },
          {
            id = "console",
            size = 0.6,
          },
        },
        position = "bottom",
        size = 10,
      },
    }

    dapui.setup(opts)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function() end
    dap.listeners.before.event_exited["dapui_config"] = function() end
  end,
}
