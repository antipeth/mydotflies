return {
  "stevearc/conform.nvim", -- 插件名称
  lazy = true, 
  event = { "BufReadPre", "BufNewFile" }, -- 触发事件（为了禁用，注释掉这一行）
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = { -- 根据文件类型配置格式化程序
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
      },
      format_on_save = { -- 配置保存时自动格式化
        lsp_fallback = true, -- 使用 LSP 作为备用
        async = false, -- 是否异步
        timeout_ms = 1000, -- 超时时间
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true, -- 使用 LSP 作为备用
        async = false, -- 是否异步
        timeout_ms = 1000, -- 超时时间
      })
    end, { desc = "格式化文件或选中范围（在可视模式下）" })
  end,
}

