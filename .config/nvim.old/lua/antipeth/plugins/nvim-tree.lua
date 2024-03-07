return {
  "nvim-tree/nvim-tree.lua", -- 插件名称
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 插件依赖
  config = function()
    local nvimtree = require("nvim-tree")

    -- 推荐的 nvim-tree 文档中的设置
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 更改树中箭头的颜色为浅蓝色
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- 配置 nvim-tree
    nvimtree.setup({
      view = {
        width = 35, -- 视图宽度
        relativenumber = true, -- 相对行号
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- 文件夹关闭时的箭头图标
              arrow_open = "", -- 文件夹打开时的箭头图标
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false, -- 禁用窗口选择器以确保与窗口分割正常工作
          },
        },
      },
      filters = {
        custom = { ".DS_Store" }, -- 自定义过滤器，过滤 .DS_Store 文件
      },
      git = {
        ignore = false,
      },
    })
    -- 在which-key中配置
    -- 设置键映射
    -- local keymap = vim.keymap -- 为了简洁性
    -- 
    -- keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "打开或关闭文件浏览器" }) -- 打开或关闭文件浏览器
    -- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "打开文件浏览器，并聚焦到文件浏览器上" }) -- 打开文件浏览器，并聚焦到文件浏览器上
    -- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "折叠文件浏览器" }) -- 折叠文件浏览器
    -- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "刷新文件浏览器" }) -- 刷新文件浏览器
  end,
}
