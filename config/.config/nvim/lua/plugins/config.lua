return {
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  }, -- the opts function can also be used to change the default opts:
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight',
    }
  }
}
