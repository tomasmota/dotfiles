-- Set leader to space
vim.g.mapleader = ' '

-- Save with <leader>
vim.keymap.set('n', '<leader>s', ':w<CR>')
-- Quit with <leader>
vim.keymap.set('n', '<leader>q', ':q<CR>')
-- Clear highlighted search
vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>')

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Mimic shell movements
vim.keymap.set('i', '<C-E>', '<ESC>A')
vim.keymap.set('i', '<C-A>', '<ESC>I')

vim.keymap.set("n", "C-r", ":luafile %<CR>")

-- Telescope stuff
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files)
vim.keymap.set('n', '<leader>fa', builtin.live_grep) -- grep across all file in current directory
vim.keymap.set('n', '<leader>fk', builtin.keymaps)
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
--vim.keymap.set('n', '<leader>fr', require('telescope').extensions.repo.repo)
vim.keymap.set("n", "<leader>le", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set('n', '<leader>h', builtin.help_tags) -- grep help docs
vim.keymap.set('n', '<leader>gst', builtin.git_status)
vim.keymap.set('n', '<c-f>', builtin.current_buffer_fuzzy_find)

local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<c-n>", ls.expand_or_jump)
vim.keymap.set({ "i", "s" }, "<c-p>", function() ls.jump(-1) end)

local gs = require("gitsigns")
vim.keymap.set('n', '<leader>gd', function() gs.diffthis() end)
vim.keymap.set('n', '<leader>gD', function() gs.diffthis("~") end)