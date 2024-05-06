return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- themes
  use 'arcticicestudio/nord-vim'
  use 'joshdick/onedark.vim'
  use 'fratajczak/one-monokai-vim'
  use 'EdenEast/nightfox.nvim'
  use 'lewpoly/sherbet.nvim'
  use 'MTDL9/vim-log-highlighting'
  use 'catppuccin/nvim'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'AlexvZyl/nordic.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'lukoshkin/highlight-whitespace'

  -- buffers and sessions
  use 'nvim-telescope/telescope.nvim'
  use 'dhruvasagar/vim-zoom'
  use 'rmagatti/auto-session'
  use 'ojroques/nvim-osc52'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'p00f/clangd_extensions.nvim'
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
  }
  use 'nvim-treesitter/nvim-treesitter'

  -- status line
  -- use 'itchyny/lightline.vim'
  use 'nvim-lualine/lualine.nvim'

  -- rust
  use 'simrat39/rust-tools.nvim'
  use 'rust-lang/rust.vim'

  -- debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- bazel
  use 'google/vim-maktaba'
  use 'bazelbuild/vim-bazel'

  use {
    'https://gn.googlesource.com/gn',
    rtp = '/misc/vim',
  }

  use 'gutenye/json5.vim'

  -- shortcuts
  use 'tpope/vim-commentary'

  use 'rktjmp/fwatch.nvim'
end)
