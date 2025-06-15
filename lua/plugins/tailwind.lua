return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {
      server = {
        override = false,
      },
      extension = {
        patterns = {
          go = {
            '%.Class%(%"(.-)%"%)',
            "%.Class%(%'(.-)%'%)",
          },
        },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "tailwind-tools" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "tailwind-tools" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").tailwindcss.setup({
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "go", "html", "templ", "gotmpl, jsx, tsx" },
        root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", ".git"),
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                [[Class\(["']([^"']+)["']\)]],
              },
            },
          },
        },
      })
    end,
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
