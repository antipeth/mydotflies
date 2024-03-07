local opt = vim.opt -- 为了简洁性

-- 行号
opt.relativenumber = true -- 显示相对行号
opt.number = true -- 在光标所在行显示绝对行号（当相对行号开启时）

-- 制表符和缩进
opt.tabstop = 2 -- 制表符宽度为2个空格
opt.shiftwidth = 2 -- 缩进宽度为2个空格
opt.expandtab = true -- 将制表符扩展为空格
opt.autoindent = true -- 在开始新行时从当前行复制缩进

-- 换行设置
opt.wrap = false -- 禁用换行

-- 搜索设置
opt.ignorecase = true -- 在搜索时忽略大小写
opt.smartcase = true -- 如果搜索包含混合大小写字符，则假设你希望区分大小写

-- 光标行
opt.cursorline = true -- 高亮当前光标行

-- 外观设置

-- 打开 termguicolors 以便 nightfly 颜色主题工作
-- （必须使用 iterm2 或其他真彩色终端）
opt.termguicolors = true
opt.background = "dark" -- 将支持明亮或深色的颜色主题设置为深色
opt.signcolumn = "yes" -- 显示标记列以防止文本偏移

-- 退格设置
opt.backspace = "indent,eol,start" -- 允许在缩进、行尾或插入模式起始位置使用退格键

-- 剪贴板
opt.clipboard:append("unnamedplus") -- 使用系统剪贴板作为默认寄存器

-- 分割窗口
opt.splitright = true -- 在右侧垂直分割窗口
opt.splitbelow = true -- 在底部水平分割窗口

-- 关闭交换文件
opt.swapfile = false
