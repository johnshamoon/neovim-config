local opts = { noremap = true, silent = true, remap=true }

-- Set comment keybind to Ctrl+/ for normal and visual modes.
-- Single line comment in normal mode.
vim.keymap.set('n', '<C-_>', 'gcc', opts)
-- Visual block comments.
vim.keymap.set('x', '<C-_>', 'gc', opts)

-- vim-zoom toggle
vim.keymap.set({ 'n', 'v', 'i' }, '<C-W>z', '<Plug>(zoom-toggle)', opts)

-- Disable recording
vim.keymap.set({ 'n', 'v' }, 'q', '<Nop>', opts)

vim.api.nvim_create_user_command('W', 'write', {})
