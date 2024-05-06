vim.opt_local.colorcolumn = "101"
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=0, bg='#282a36' })
vim.api.nvim_set_hl(0, 'MyInlayHintColor', {fg = '#7b748a'})

vim.g.rustfmt_autosave = 1
-- This is necessary because rustfmt_autosave is really slow without it for some reason
vim.g.rust_fold = 0
