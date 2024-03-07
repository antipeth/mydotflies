return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- 导入 nvim-lspconfig 插件
    local lspconfig = require("lspconfig")

    -- 导入 cmp-nvim-lsp 插件
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- 为了简洁性

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- 设置快捷键
      opts.desc = "显示 LSP 引用"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- 显示定义和引用

      opts.desc = "转到声明"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- 转到声明

      opts.desc = "显示 LSP 定义"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- 显示 LSP 定义

      opts.desc = "显示 LSP 实现"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- 显示 LSP 实现

      opts.desc = "显示 LSP 类型定义"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- 显示 LSP 类型定义

      opts.desc = "查看可用的代码操作"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- 查看可用的代码操作，按在可视模式中将应用于选择

      opts.desc = "智能重命名"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 智能重命名

      opts.desc = "显示缓冲区诊断"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- 显示文件的诊断

      opts.desc = "显示行诊断"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- 显示行的诊断

      opts.desc = "跳转到上一个诊断"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- 在缓冲区中跳转到上一个诊断

      opts.desc = "跳转到下一个诊断"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- 在缓冲区中跳转到下一个诊断

      opts.desc = "显示光标下内容的文档"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- 显示光标下内容的文档

      opts.desc = "重启 LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- 重启 LSP（如果需要的话）
    end

    -- 用于启用自动补全（分配给每个 LSP 服务器配置）
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- 更改符号列（gutter）中的诊断符号
    --（在 YouTube 上的 nvim 视频中没有）
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- 配置 html 服务器
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置带有插件的 TypeScript 服务器
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置 CSS 服务器
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置 Tailwind CSS 服务器
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置 Svelte 服务器
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    -- 配置 Prisma ORM 服务器
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置 GraphQL 语言服务器
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- 配置 Emmet 语言服务器
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- 配置 Python 服务器
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- 配置 Java 服务器
    lspconfig["jdtls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    

    -- 配置 Lua 服务器（带有特殊设置）
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- Lua 的自定义设置
        Lua = {
          -- 使语言服务器识别 "vim" 全局变量
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- 使语言服务器了解运行时文件
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
