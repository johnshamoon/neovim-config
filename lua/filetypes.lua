-- au BufNewFile,BufRead *.bp setlocal shiftwidth=4 softtabstop=4 expandtab
-- au BufNewFile,BufRead *.json setlocal shiftwidth=2 softtabstop=2 expandtab
-- au BufNewFile,BufRead *.cml setlocal shiftwidth=4 softtabstop=4 expandtab ft=json5 syntax=json5
-- au BufNewFile,BufRead *.lua setlocal shiftwidth=2 softtabstop=2 expandtab syntax=lua
-- au BufNewFile,BufRead *.bazel setlocal shiftwidth=4 softtabstop=4 expandtab syntax=bzl
-- au BufNewFile,BufRead *.bzl setlocal shiftwidth=4 softtabstop=4 expandtab syntax=bzl
-- au BufNewFile,BufRead *.aidl setlocal shiftwidth=4 softtabstop=4 expandtab syntax=java
-- autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
-- autocmd Filetype java setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
-- autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4


vim.filetype.add({
  extension = {
    aidl = 'java',
    cml = 'json5',
    fidl = 'fidl',
    gn = 'gn',
    gni = 'gn',
  }
})

local function set_ft_option(ft, group, option, value)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    group = vim.api.nvim_create_augroup(group, { clear = false }),
    desc = ('set option "%s" to "%s" for this filetype'):format(option, value),
    callback = function()
      vim.opt_local[option] = value
    end
  })
end

set_ft_option({ 'c', 'cc', 'cpp', 'json5' }, 'CommentaryOptions', 'commentstring', '// %s')
set_ft_option({ 'gn', 'gni' }, 'CommentaryOptions', 'commentstring', '# %s')

-- vim.api.nvim_command[[autocmd BufWritePre { '.c', '.cc', '.cpp', '.h' } lua vim.lsp.buf.formatting_sync()]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.c', '*.cc', '*.cpp', '*.h' },
  -- group = vim.api.nvim_create_augroup("AutoFormat", {clear = false}),
  callback = function()
    vim.lsp.buf.format()
  end
})
