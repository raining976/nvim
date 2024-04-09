-- 文件目录树
local nvim_tree_plugin = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local status , nvim_tree = pcall(require, "nvim-tree")
        if not status then
          vim.notify("没有找到 nvim_tree")
          return
        end
        nvim_tree.setup {
          git = {
            enable = true,
          },
          -- 过滤文件
          filters = {
            dotfiles = true , -- 过滤 dotfiles
            custom = { "node_modules"}, -- 其他自定义
          },
          view = {
            side = "left", -- 文件浏览器位置
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            width = 30,
          },

        }
    end
}

return { nvim_tree_plugin }

