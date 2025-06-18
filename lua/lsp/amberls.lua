local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

if not configs.amberls then
  configs.amberls = {
    default_config = {
      cmd = { "amber-lsp" },
      filetypes = { "amber" },
      root_dir = function(fname)
        return util.root_pattern(".git")(fname) or vim.fn.fnamemodify(fname, ":p:h")
      end,
      settings = {},
    },
  }
end
