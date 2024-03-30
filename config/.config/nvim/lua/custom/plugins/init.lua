-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

vim.opt.tabstop = 2
vim.opt.relativenumber = true
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'brenton-leighton/multiple-cursors.nvim',
  --   version = '*',
  --   opts = {},
  --   keys = {
  --     { '<C-d>', '<Cmd>MultipleCursorsAddMatches<CR>', mode = { 'n', 'x' } },
  --     { '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = { 'n', 'i' } },
  --   },
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.cmd 'colorscheme gruvbox'
    end,
  },
  'github/copilot.vim',
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'bash',
        'html',
        'lua',
        'tsx',
        'typescript',
        'http',
      },
    },
  },
  -- {
  --   'nvim-neotest/neotest',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'nvim-neotest/neotest-jest' },
  --   opts = { adapters = { 'neotest-jest' } },
  -- },
}
