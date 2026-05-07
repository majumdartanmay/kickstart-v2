-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    opts = {
      delete_to_trash = true,
      keymaps = {
        ['gy'] = 'actions.yank_entry',
      },
    },
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      require('oil').setup {
        keymaps = {
          ['gy'] = 'actions.yank_entry',
          ['<C-s>'] = false,
        },
      }
    end,
    lazy = false,
  },

  -- 🔽 Add another plugin here
  {
    'tpope/vim-fugitive',
  },
  {
    'nvim-lualine/lualine.nvim',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'github/copilot.vim',
  },
}
