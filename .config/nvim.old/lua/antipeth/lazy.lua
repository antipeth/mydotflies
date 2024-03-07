-- 获取 lazy.nvim 存储路径
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果 lazy.nvim 尚未安装，则通过 git clone 进行安装
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- 最新稳定版本
		lazypath,
	})
end

-- 将 lazy.nvim 的路径添加到运行时路径中
vim.opt.rtp:prepend(lazypath)

-- 配置并加载 lazy.nvim
require("lazy").setup({
	{ import = "antipeth.plugins" }, -- 导入自定义插件
	{ import = "antipeth.plugins.lsp" }, -- 导入 LSP 相关设置
}, {
	install = {
		colorscheme = { "nightfly" }, -- 安装颜色主题 nightfly
	},
	checker = {
		enabled = true, -- 启用代码检查
		notify = false, -- 不显示通知
	},
	change_detection = {
		notify = false, -- 不显示更改通知
	},
})
