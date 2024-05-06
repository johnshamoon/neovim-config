require('colorschemes')
require('cpp_lsp_config')
require('rust_lsp_config')
require('nvim-cmp-config')
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'fidl', 'gn', 'json5', 'lua', 'c', 'cpp', 'rust', 'vim', 'java' },
  highlight = {
    enable = true,
    disable = { 'cpp', 'rust', },
  }
})

require('fidget').setup({
  window = {
    blend = 0,
  }
})

require('highlight-whitespace').setup({
  palette = {
    -- Use this setting for all filetypes.
    other = {
      tws = 'DarkGray'
    }
  }
})

require('auto-session').setup({
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/'},
})

require('telescope').setup({
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
    buffers = {
      mappings = {
        i = {
          ['<c-d>'] = 'delete_buffer',
        }
      }
    }
  }
})

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_x = {},
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
})

require('osc52').setup({
  trim = true
})

-- Disable lsp highlighting.
-- vim.api.nvim_set_hl(0, '@lsp.type.function', {})
-- for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
--   vim.api.nvim_set_hl(0, group, {})
-- end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

require('fwatch-config')
