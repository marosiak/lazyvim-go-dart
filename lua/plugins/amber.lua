return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    require("lsp.amberls")

    opts.servers = opts.servers or {}
    opts.servers.amberls = {}

    vim.filetype.add({
      extension = {
        ab = "amber",
      },
    })

    local function run_amber_subcommand(subcommand)
      local filepath = vim.api.nvim_buf_get_name(0)

      if filepath == "" then
        vim.notify("Invalid file", vim.log.levels.WARN)
        return
      end

      vim.fn.jobstart({ "amber", subcommand, filepath }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if data then
            local output = table.concat(data, "\n")
            if #output > 0 then
              local level = output:match("ERROR") and vim.log.levels.ERROR or vim.log.levels.INFO
              vim.notify(output, level, { title = "Amber " .. subcommand })
            end
          end
        end,
      })
    end

    vim.api.nvim_create_user_command("AmberBuild", function()
      run_amber_subcommand("build")
    end, {})

    vim.api.nvim_create_user_command("AmberRun", function()
      run_amber_subcommand("run")
    end, {})
  end,
}
