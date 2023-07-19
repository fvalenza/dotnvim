-- If the keymaps do not work here, add them to keymaps.lua
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

local M = {
  "mfussenegger/nvim-dap",
  commit = "6b12294a57001d994022df8acbe2ef7327d30587",
  event = "VeryLazy",
  keys = {
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint", mode = "n", opts_keymap },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", mode = "n", opts_keymap },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step into", mode = "n", opts_keymap },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step over", mode = "n", opts_keymap },
    { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step out", mode = "n", opts_keymap },
    { "<leader>dr", "<cmd>lua require'dap'.rep.toggle()<cr>", desc = "Toggle interpreter", mode = "n", opts_keymap },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "run last", mode = "n", opts_keymap },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle dapui", mode = "n", opts_keymap },
    { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate", mode = "n", opts_keymap },
  },
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

M = {
  "ravenxrz/DAPInstall.nvim",
  commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
  config = function()
    require("dap_install").setup {}
    require("dap_install").config("python", {})
  end,
}

return M
