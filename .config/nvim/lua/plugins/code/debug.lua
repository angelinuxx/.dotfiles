return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      require("dapui").setup()
      vim.api.nvim_set_keymap("n", "<leader>do", ":lua require'dapui'.open()<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require'dapui'.close()<cr>", {})
      -- local dap, dapui = require("dap"), require("dapui")
      -- dap.listeners.after.event_initialized["dapui_config"] = function()
      --   dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require "dap"
  --
  --     -- php debug
  --     dap.adapters.php = {
  --       type = "executable",
  --       command = "node",
  --       args = { os.getenv "HOME" .. ".local/share/nvim/dap/vscode-php-debug/out/phpDebug.js" },
  --     }
  --     dap.configurations.php = {
  --       {
  --         type = "php",
  --         request = "launch",
  --         name = "Listen for Xdebug",
  --         port = 9003,
  --         pathMappings = {
  --           ["/var/www/html"] = "${workspaceFolder}",
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
      vim.g.dap_virtual_text = true
    end,
  },
  "nvim-telescope/telescope-dap.nvim",
}
