require('nightfox').setup({
  options = {
    transparent = true,    -- Disable setting background
    styles = {
      -- comments = "bold",
      keywords = "bold",
      conditionals = "bold",
    },
  },
  palettes = {
    all = {
      -- comment = "#e87a35", -- orange
      comment = "#5979e3",
      LspInlayHint = '#7b748a',
      -- sel0 = "#131a24", -- Popup bg, visual selection bg
      -- sel1 = "#131a24", -- Popup sel bg, search bg
    },
  }
})

require('catppuccin').setup({
  transparent_background = true,
  styles = {
    -- turn off italics by default
    comments = {},
    conditionals = {},
    keywords = { "bold" },
  },

  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.latte_overlay0 },
    }
  end
})

require('nordic').setup({
  transparent_bg = true,
})

require('dracula').setup({
  transparent_bg = true,
})

-- vim.cmd("colorscheme catppuccin-frappe")
vim.cmd("colorscheme nightfox")
