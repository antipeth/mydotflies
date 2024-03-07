return {
  "hrsh7th/nvim-cmp", -- 插件名称
  event = "InsertEnter", -- 触发插件的事件
  dependencies = {
    "hrsh7th/cmp-buffer", -- 缓冲区文本源
    "hrsh7th/cmp-path", -- 文件系统路径源
    "L3MON4D3/LuaSnip", -- 代码片段引擎
    "saadparwaiz1/cmp_luasnip", -- 用于自动完成的 LuaSnip 支持
    "rafamadriz/friendly-snippets", -- 有用的代码片段
    "onsails/lspkind.nvim", -- 类似 VS Code 的图标
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- 从已安装插件（如 friendly-snippets）加载 VS Code 风格的代码片段
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- 配置 nvim-cmp 如何与代码片段引擎交互
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- 上一个建议
        ["<C-j>"] = cmp.mapping.select_next_item(), -- 下一个建议
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- 显示自动完成建议
        ["<C-e>"] = cmp.mapping.abort(), -- 关闭自动完成窗口
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- 自动完成源
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" }, -- 代码片段
        { name = "buffer" }, -- 当前缓冲区内的文本
        { name = "path" }, -- 文件系统路径
      }),
      -- 配置 lspkind，以在自动完成菜单中显示类似 VS Code 的图标
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
