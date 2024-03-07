return {
  "akinsho/bufferline.nvim", -- 插件名称
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 依赖的插件
  version = "*", -- 插件版本
  opts = {
    options = {
      mode = "tabs", -- 模式，这里使用 "tabs" 模式
      separator_style = "slant", -- 选项卡分隔符样式，这里使用 "slant"
    },
  },
}

