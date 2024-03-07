return {
    "iamcco/markdown-preview.nvim",
    VeryLazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        -- 设置Markdown预览相关选项
        vim.g.mkdp_auto_start = 1  -- 进入Markdown缓冲区后自动打开预览窗口，默认为0
        vim.g.mkdp_auto_close = 1  -- 切换到其他缓冲区时自动关闭当前预览窗口，默认为1
        vim.g.mkdp_refresh_slow = 1  -- 当保存缓冲区或退出插入模式时刷新Markdown，默认为0
        vim.g.mkdp_command_for_global = 0  -- MarkdownPreview命令是否可用于所有文件，默认为0
        vim.g.mkdp_open_to_the_world = 0  -- 预览服务器是否对外开放，默认为0
        vim.g.mkdp_open_ip = ''  -- 用于打开预览页面的自定义IP，默认为空
        vim.g.mkdp_browser = 'chromiun'  -- 指定打开预览页面的浏览器，默认为空
        vim.g.mkdp_echo_preview_url = 0  -- 在命令行中输出预览页面的URL，默认为0
        vim.g.mkdp_browserfunc = ''  -- 用于打开预览页面的自定义Vim函数名，默认为空
        vim.g.mkdp_preview_options = {  -- Markdown渲染选项
            mkit = {},
            katex = {},
            uml = {},
            maid = {},
            disable_sync_scroll = 0,
            sync_scroll_type = 'middle',
            hide_yaml_meta = 1,
            sequence_diagrams = {},
            flowchart_diagrams = {},
            -- content_editable = v:false,
            disable_filename = 0,
            toc = {}
        }
        vim.g.mkdp_markdown_css = ''  -- 自定义Markdown样式表路径，默认为空
        vim.g.mkdp_highlight_css = ''  -- 自定义语法高亮样式表路径，默认为空
        vim.g.mkdp_port = ''  -- 自定义启动服务器的端口号，默认为空
        vim.g.mkdp_page_title = '「${name}」'  -- 预览页面标题，${name}将被文件名替换
        vim.g.mkdp_images_path = ''  -- 自定义图像位置，默认为空
        vim.g.mkdp_filetypes = {'markdown'}  -- 支持的文件类型，默认为markdown
        vim.g.mkdp_theme = 'dark'  -- 默认主题（dark或light），默认根据系统偏好定义主题
        vim.g.mkdp_combine_preview = 0  -- 合并预览窗口，默认为0
        vim.g.mkdp_combine_preview_auto_refresh = 1  -- 当更改Markdown缓冲区时自动刷新合并预览内容，仅在g:mkdp_combine_preview为1时有效，默认为1

  
    end,
}