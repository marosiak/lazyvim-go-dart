return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    local source = {}
    source.new = function()
      local self = setmetatable({}, { __index = source })
      self.items = {}
      local path = vim.fn.stdpath("config") .. "/syntaxes/amber.tmLanguage.json"
      if vim.fn.filereadable(path) == 0 then
        return self
      end
      local content = table.concat(vim.fn.readfile(path), "\n")
      local ok, grammar = pcall(vim.fn.json_decode, content)
      if not ok then
        return self
      end
      local seen = {}
      local function walk(n)
        if type(n) ~= "table" then
          return
        end
        if n.match then
          for w in n.match:gmatch("%w+") do
            if w ~= "b" and not seen[w] then
              table.insert(self.items, { label = w, kind = cmp.lsp.CompletionItemKind.Keyword })
              seen[w] = true
            end
          end
        end
        for _, v in pairs(n) do
          if type(v) == "table" then
            walk(v)
          end
        end
      end
      walk(grammar)
      return self
    end
    source.complete = function(self, _, cb)
      cb({ items = self.items, isIncomplete = false })
    end
    source.get_trigger_characters = function()
      return { "." }
    end

    cmp.register_source("amber", source.new())

    cmp.setup.filetype("amber", {
      sources = cmp.config.sources({
        { name = "amber" },
        { name = "nvim_lsp" },
        { name = "buffer" },
      }),
    })
  end,
}
