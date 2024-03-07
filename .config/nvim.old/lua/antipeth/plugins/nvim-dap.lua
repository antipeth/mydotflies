return {
  "mfussenegger/nvim-dap", -- 插件名称
  "rcarriga/nvim-dap-ui", -- 调试界面
  
  config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
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
      -- vim.keymap.set("n", "<Leader>ldt", ':DapToggleBreakpoint<CR>')
      -- vim.keymap.set("n", "<Leader>ldx", ':DapTerminate<CR>')
      -- vim.keymap.set("n", "<Leader>ldo", ':DapStepOver<CR>')     
  end,
}

