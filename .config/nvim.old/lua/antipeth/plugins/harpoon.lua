return {
  "ThePrimeagen/harpoon", -- 插件名称
  dependencies = {
    "nvim-lua/plenary.nvim", -- 依赖的插件
  },
  -- config = function()
  --   -- 设置键位映射
  --   local keymap = vim.keymap -- 为了简洁性
  -- 
  -- 
  --   keymap.set(
  --     "n",
  --     "<leader>hm",
  --     "<cmd>lua require('harpoon.mark').add_file()<cr>",
  --     { desc = "使用 harpoon 标记文件" }
  --   )
  --   keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "跳转到下一个 harpoon 标记" })
  --   keymap.set(
  --     "n",
  --     "<leader>hp",
  --     "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
  --     { desc = "跳转到上一个 harpoon 标记" }
  --   )
  -- end,
}

