return {
  "CRAG666/code_runner.nvim",
  keys = {
    { "<leader>r", ":RunCode<CR>" },
    { "<leader>rc", ":RunClose<CR>" },
  },
  opts = function(_, opts)
    local code_runner = require("code_runner")
    opts.filetype = {
      cpp = {
        "cd $dir &&",
        "g++ -g $fileName -o $fileNameWithoutExt.exe &&",
        "$dir\\$fileNameWithoutExt.exe",
      },
      python = "python -u",
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
    }
    code_runner.setup(opts)
  end,
}
