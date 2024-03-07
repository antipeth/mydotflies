return {
  "rmagatti/auto-session", -- 插件名称
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false, -- 是否自动恢复会话，默认为 false
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" }, -- 指定不保存会话的目录列表
    })

    -- local keymap = vim.keymap
    -- 
    -- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "为当前目录恢复上次工作区会话" }) -- 为当前目录恢复上次工作区会话
    -- keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "为自动会话根目录保存工作区会话" }) -- 为当前工作目录保存工作区会话
  end,
}

