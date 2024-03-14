return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      opts.handlers = {
        ["language/status"] = function(_, result) end,
        ["$/progress"] = function(_, result, ctx) end,
      }
      return opts
    end,
  },
}
