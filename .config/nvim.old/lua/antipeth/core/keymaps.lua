-- 设置 leader 键为空格
vim.g.mapleader = " "

local keymap = vim.keymap -- 为了简洁性

-- 常规键映射 -------------------

-- 使用 jj 退出插入模式
keymap.set("i", "jj", "<ESC>", { desc = "使用 jk 退出插入模式" })

-- 清除搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "清除搜索高亮" })

-- 删除单个字符而不复制到寄存器
keymap.set("n", "x", '"_x')

-- 增加/减少数字
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "增加数字" }) -- 增加
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "减少数字" }) -- 减少

-- 窗口管理
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "纵向分割窗口" }) -- 纵向分割窗口
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "横向分割窗口" }) -- 横向分割窗口
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "使分割窗口尺寸相等" }) -- 使分割窗口尺寸相等
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "关闭当前分割窗口" }) -- 关闭当前分割窗口
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "打开新标签页" }) -- 打开新标签页
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "关闭当前标签页" }) -- 关闭当前标签页
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "切换到下一个标签页" }) -- 切换到下一个标签页
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "切换到上一个标签页" }) -- 切换到上一个标签页
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "在新标签页中打开当前缓冲区" }) -- 将当前缓冲区移动到新标签页
