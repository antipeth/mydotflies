return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- 导入 nvim-treesitter 插件
      local treesitter = require("nvim-treesitter.configs")

      -- 配置 treesitter
      treesitter.setup({
        -- 启用语法高亮
        highlight = {
          enable = true,
        },
        -- 启用缩进
        indent = { enable = true },
        -- 启用自动标签（使用 nvim-ts-autotag 插件）
        autotag = {
          enable = true,
        },
        -- 确保这些语言解析器已安装
        ensure_installed = {
          "java",
          "c",
          "rust",
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- 启用 nvim-ts-context-commentstring 插件以在 tsx 和 jsx 文件中进行注释
      -- require('ts_context_commentstring').setup {}
    end,
  },
}
