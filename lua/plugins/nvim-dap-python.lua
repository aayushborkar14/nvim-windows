return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/python.exe"))
  end,
}
