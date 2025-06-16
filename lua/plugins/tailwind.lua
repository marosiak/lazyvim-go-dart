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
      cmp = {
        highlight = "foreground",
      },
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = "󰝤 ",
        debounce = 200,
      },
      conceal = {
        enabled = true,
        min_length = nil,
        symbol = "󱏿",
        highlight = {
          fg = "#38BDF8",
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
    opts = {
      servers = {
        tailwindcss = {
          filetypes = { "go", "html", "templ", "gotmpl", "jsx", "tsx" },
          root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", ".git"),
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  [[Class\(["']([^"']+)["']\)]],
                },
              },
              includeLanguages = {
                go = "html",
              },
            },
          },
          init_options = {
            userLanguages = {
              go = "html",
            },
          },
        },
      },
    },
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
