return {
  "christoomey/vim-tmux-navigator",
  cmd = { -- 定义命令，这些命令将与插件提供的命令相对应
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = { -- 设置快捷键映射
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" }, -- Ctrl + h 映射到左侧 tmux 窗格导航
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" }, -- Ctrl + j 映射到下方 tmux 窗格导航
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" }, -- Ctrl + k 映射到上方 tmux 窗格导航
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" }, -- Ctrl + l 映射到右侧 tmux 窗格导航
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" }, -- Ctrl + \ 映射到上一个 tmux 窗格导航
  },
}

