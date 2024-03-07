return {
  "windwp/nvim-autopairs", -- 插件名称
  event = { "InsertEnter" }, -- 触发事件
  dependencies = {
    "hrsh7th/nvim-cmp", -- 依赖的插件
  },
  config = function()
    -- 导入 nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- 配置 autopairs
    autopairs.setup({
      check_ts = true, -- 启用 treesitter
      ts_config = {
        lua = { "string" }, -- 不在 lua 字符串 treesitter 节点中添加配对符号
        javascript = { "template_string" }, -- 不在 javascript template_string treesitter 节点中添加配对符号
        java = false, -- 不在 java 中检查 treesitter
      },
    })

    -- 导入 nvim-autopairs 完成功能
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- 导入 nvim-cmp 插件（补全插件）
    local cmp = require("cmp")

    -- 使 autopairs 和 completion 协同工作
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

