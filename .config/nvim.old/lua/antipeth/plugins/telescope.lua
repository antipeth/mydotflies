return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- 移动到上一个搜索结果
            ["<C-j>"] = actions.move_selection_next, -- 移动到下一个搜索结果
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- 设置键位映射
    local keymap = vim.keymap -- 为了简洁性

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "在当前目录模糊查找文件" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "在最近文件中模糊查找文件" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "在当前目录查找字符串" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "在当前目录查找光标下的字符串" })
  end,
}

