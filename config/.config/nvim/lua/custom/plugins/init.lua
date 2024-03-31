-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

vim.opt.tabstop = 2
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>n', ':bn<cr>')
vim.keymap.set('n', '<leader>p', ':bp<cr>')
vim.keymap.set('n', '<leader>x', ':bd<cr>')

--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {}

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

      function _lazygit_toggle()
        lazygit:toggle()
      end
    end,
    keys = {
      { '<leader>lg', '<Cmd>lua _lazygit_toggle()<CR>', mode = 'n' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
    end,
    keys = {
      { '<leader>e', '<Cmd>NvimTreeFindFileToggle<CR>', mode = 'n' },
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {}
    end,
  },
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim' },
    config = function()
      require('rest-nvim').setup()
    end,
    keys = {
      { '<Leader>rr', '<Cmd>Rest run<CR>', mode = 'n' },
      { '<Leader>rl', '<Cmd>Rest run last<CR>', mode = 'n' },
    },
  },
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
