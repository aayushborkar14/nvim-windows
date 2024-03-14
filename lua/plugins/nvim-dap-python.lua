return {
  "mfussenegger/nvim-dap-python",
  config = function()
    local path = require("mason-registry").get_package("debugpy"):get_install_path()
    require("dap-python").setup(path .. "/venv/Scripts/python")
  end,
}
