local bufferline_plugin = {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        local status, bufferline = pcall(require,"bufferline")
        if not status then
            vim.notify("没有找到 bufferline")
            return
        end
        bufferline.setup {
            options = {
                -- 使用 nvim 内置lsp
                diagnostics = "nvim_lsp",
                -- 左侧让出 nvim-tree 的位置
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "directory",
                        text_align = "left"
                    }
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
            }
        }
    end,

 }

return { bufferline_plugin } 

