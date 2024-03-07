-- 请先安装 google-java-format，
-- 并添加到环境变量
return {
    "sbdchd/neoformat",  -- 保存后自动格式化
    ft = { "java" },  -- 仅对java文件类型生效
    config = function()

        -- 设置 Neoformat 对 Java 的格式化配置
        vim.g.neoformat_enabled_java = { 
            exe = 'google-java-format',
            args = { '--aosp' },
            stdin = 1 
        }

        -- 设置键位映射
        local keymap = vim.keymap -- 为了简洁性

        -- 设置自定义键位映射
        -- keymap.set("n", "<leader>lj", "<cmd>split term://javac %:r.java && java %:r<CR>:startinsert<CR>", { desc = "编译并运行 Java 文件" })
        -- 快捷运行当前文件
    end,
}
