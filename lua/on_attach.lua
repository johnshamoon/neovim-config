local opts = { noremap=true, silent=true }
local telescope_builtin = require'telescope.builtin'

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<CR>', opts)

local status, dynamic_dirs = pcall(require, 'private/telescope_dirs')
if not status then
  dynamic_dirs = {}
end

-- Configure Telescope find_files with extra directories sometimes. These are currently relative to
-- //src/sensors/ in the Fuchsia tree.
local os = require('os')
local current_search_dirs = { os.getenv('PWD') }

if os.getenv('PWD') ~= 'src/sensors' then
  for _,v in pairs(dynamic_dirs) do
    table.insert(current_search_dirs, v)
  end
end

local function toggle_search_dirs()
  if #current_search_dirs == 1 then
    for _,v in ipairs(dynamic_dirs) do
      table.insert(current_search_dirs, v)
    end
  else
    -- Reset to just be pwd when toggling off, this probably won't be that often.
    current_search_dirs = { require('os').getenv('PWD') }
  end
end
vim.keymap.set('n', '<leader>F', toggle_search_dirs)

-- opts.callback = function() telescope_builtin.find_files() end
opts.callback = function() telescope_builtin.find_files({search_dirs = current_search_dirs}) end
vim.api.nvim_set_keymap('n', '<leader>o', '', opts)

opts.callback = function() telescope_builtin.buffers() end
vim.api.nvim_set_keymap('n', '<leader>b', '', opts)

opts.callback = function() telescope_builtin.grep_string() end
vim.api.nvim_set_keymap('n', '<leader>g', '', opts)

opts.callback = function() telescope_builtin.live_grep() end
vim.api.nvim_set_keymap('n', '<leader>G', '', opts)

vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- vim.lsp.inlay_hint.enable(bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  opts.callback = function() telescope_builtin.lsp_definitions() end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '', opts)

  opts["callback"] = nil
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  opts.callback = function() telescope_builtin.lsp_implementations() end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '', opts)

  opts["callback"] = nil
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>i', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

  opts.callback = function() telescope_builtin.lsp_references() end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '', opts)

  opts["callback"] = nil
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

return on_attach
