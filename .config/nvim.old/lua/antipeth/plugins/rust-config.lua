return {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()

        -- 配置 hover action
        vim.keymap.set(
            "n", 
            "<leader>lr", 
            function()
                vim.cmd.RustLsp( 'hover', 'actions' ) -- 支持 rust-analyzer 的分组
                -- 或者 vim.lsp.buf.codeAction()，如果你不想分组。
            end,
            { silent = true, buffer = bufnr }
        ) 

        -- 配置 hover action 的 auto focus
        vim.g.rustaceanvim = {
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
        }
    end,
}
