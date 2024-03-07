return {
  "numToStr/Comment.nvim", -- 插件名称
  event = { "BufReadPre", "BufNewFile" }, -- 触发插件的事件
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- 依赖的插件
  },
  config = function()
    -- 安全地导入 Comment 插件
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- 启用 Comment 插件
    comment.setup({
      -- 用于在 tsx 和 jsx 文件中进行注释
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
