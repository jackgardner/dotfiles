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
    'nvim-neotest/neotest',
    dependencies = {
      'vim-test/vim-test',
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-go',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-go',
          require 'neotest-jest',
        },
      }
    end,
    keys = {
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        mode = 'n',
        desc = 'Test whole file',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.toggle()
        end,
        mode = 'n',
        desc = 'Test watch',
      },
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
        end,
        mode = 'n',
        desc = 'Test nearest',
      },
      {
        '<leader>tv',
        function()
          require('neotest').output_panel.toggle()
        end,
        mode = 'n',
        desc = 'Test visit',
      },
    },
  },
  -- {
  --   'vim-test/vim-test',
  --   keys = {
  --     { '<leader>tf', '<Cmd>TestFile<CR>', mode = 'n', desc = 'Test whole file' },
  --     { '<leader>tn', '<Cmd>TestNearest<CR>', mode = 'n', desc = 'Test nearest' },
  --     { '<leader>tl', '<Cmd>TestLast<CR>', mode = 'n', desc = 'Test last' },
  --     { '<leader>ts', '<Cmd>TestSuite<CR>', mode = 'n', desc = 'Test suite' },
  --     { '<leader>tv', '<Cmd>TestVisit<CR>', mode = 'n', desc = 'Test visit' },
  --   },
  --   config = function()
  --     vim.g['test#strategy'] = 'neovim'
  --   end,
  -- },
  {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua' },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdLineEnter' },
    ft = { 'go', 'gomod' },
    build = ":lua require('go.install').update_all_sync()",
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end)
      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end)
    end,
  },
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
    lazy = false,
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
