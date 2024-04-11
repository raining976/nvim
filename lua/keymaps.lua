-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.keymap.set

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
-- vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
-- vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
-- vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


-- map jk to <Esc>
vim.keymap.set('i','jk','<ESC>',opts)

-- C-u C-d 只移动11行，默认半屏
vim.keymap.set('n', '<C-u>', '5k', opts)
vim.keymap.set('n', '<C-d>', '5j', opts)

-- nvim-tree
map('n', '<C-m>', ':NvimTreeToggle<CR>',opts)
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
-- 查找文件
map('n','<leader>ff', ':Telescope find_files<CR>', opts)
-- 全局搜索
map('n','<leader>fg', ':Telescope live_grep<CR>', opts)
-- map('n', '<leader>ff', builtin.find_files, {})
-- map('n', '<leader>fg', builtin.live_grep, {})
-- map('n', '<leader>fb', builtin.buffers, {})
-- map('n', '<leader>fh', builtin.help_tags, {})

-- bufferline 左右切换tab
map("n", "<C-p>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
map("n", "<C-x>", "",opts)
map("n", "<C-x>l", ":BufferLineCloseLeft<CR>",opts)
map("n", "<C-x>r", ":BufferLineCloseRight<CR>",opts)
map("n", "<C-x>o", ":BufferLineCloseOthers<CR>",opts)


-- save
map("n", "s", "", opts)
map("n", "<Leader>s",":w<CR>",opts)

-- quit
map("n", "q", "", opts)
map("n", "<Leader>q",":q<CR>", opts)
map("n", "<Leader>Q",":q!<CR>", opts)

-- 修改^和$的映射
map("n", "H","^",opts)
map("n", "L","$",opts)

-- neo formatter

map('n','<A-F>',':Neoformat<CR>',opts)


-----------------
-- Insert mode --
-----------------

map('i', '<C-h>', '<ESC>I', opts)
map('i', '<C-l>', '<ESC>A', opts)

map('i', 'C-j', '<ESC>o', opts)
map('i', 'C-k', '<ESC>O', opts)

-- Neoformat

map('n','<A-f>',':Neoformat<CR>',opts)


-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

