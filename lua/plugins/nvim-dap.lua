return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.set_log_level("TRACE")
  end,
}
