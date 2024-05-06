local rt = require('rust-tools')
-- local lspconfig = require('lspconfig')
local on_attach = require('on_attach')

local fuchsia = string.find(vim.loop.cwd() or "", "/fuchsia")
local fx_clippy = { overrideCommand = { "fx", "clippy", "-f", "$saved_file", "--raw" } }

local opts = {
  server = {
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        inlayHints = {
          maxLength = 100,
        },
        -- Use fx clippy if we're in the Fuchsia tree.
        checkOnSave = fuchsia and fx_clippy or { command = 'clippy' },
        cachePriming = { enable = false },
        diagnostics = { disabled = { 'unresolved-proc-macro' } },
        completion = { callable = { snippets = 'none' }, postfix = { enable = false } },
      },
    },
  },
  tools = {
    inlay_hints = {
      -- defined in after/ftplugin/rust.lua
      highlight = 'MyInlayHintColor'
    },
  },
}

-- local opts = {
--     on_attach = on_attach,
--     settings = {
--       ['rust-analyzer'] = {
--         inlayHints = {
--           maxLength = 100,
--         },
--         checkOnSave = fuchsia and fx_clippy or { command = 'clippy' },
--         cachePriming = { enable = false },
--         diagnostics = { disabled = { 'unresolved-proc-macro' } },
--         completion = { callable = { snippets = 'none' }, postfix = { enable = false } },
--       },
--   },
--   inlay_hints = {
--     auto = true,
--   }
--   -- tools = {
--   --   inlay_hints = {
--   --     -- defined in .vimrc
--   --     highlight = 'MyInlayHintColor'
--   --   },
--   -- },
-- }
-- lspconfig.rust_analyzer.setup(opts)

rt.setup(opts)
