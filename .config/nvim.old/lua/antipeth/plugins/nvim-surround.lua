return {
  "kylechui/nvim-surround", -- 插件名称
  event = { "BufReadPre", "BufNewFile" }, -- 触发事件
  version = "*", -- 用于稳定性; 省略以使用最新功能的 `main` 分支
  config = true, -- 使用默认配置（如果配置为 true）
}

