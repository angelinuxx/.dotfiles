-- return {}
return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
      local keymap = vim.api.nvim_set_keymap
      keymap("n", "<leader>dt", ":lua require'dapui'.toggle()<cr>", { desc = "Toggle DAP UI", noremap = true })
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = {},
    config = function()
      local keymap = vim.api.nvim_set_keymap

      keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
      keymap("n", "<leader>dx", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Toggle breakpoint" })
      keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
      keymap("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over (next)" })
      keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
      keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
      keymap("n", "<leader>dT", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Step out" })

      vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
      vim.fn.sign_define("DapStopped", { text = "" })

      -- adapters configurations are in lua/plugins/code/mason.lua because I use mason_nvim_dap to install adapters
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
      vim.g.dap_virtual_text = true
    end,
  },
  --   "nvim-telescope/telescope-dap.nvim",
  -- go debugger
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
            -- tell which host and port to connect to
            connect = {
              host = "127.0.0.1",
              port = "9004",
            },
            substitutepath = { {
              from = vim.fn.getcwd(),
              to = "/go/src/app",
            } },
          },
        },
        delve = {
          port = "9004",
        },
      }
    end,
  },
}
