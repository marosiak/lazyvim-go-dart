return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      vim.cmd.GoInstallDeps()
    end,

    keys = {
      { "<leader>cg", function() end, desc = "Golang" },
      { "<leader>cgt", "<cmd>GoMod tidy<CR>", desc = "go mod tidy" },
      { "<leader>cgj", "<cmd>GoTagAdd json><CR>", desc = "Add json tags" },
      { "<leader>cgJ", "<cmd>GoTagRm json><CR>", desc = "Remove json tags" },
    },
  },
}
