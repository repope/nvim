return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()
    vim.keymap.set('n', '<leader>rt', function()
      vim.cmd 'wa'
      vim.cmd 'GoTestFile'
    end, { desc = '[R]un Go [T]est' })
    -- vim.keymap.set('n', '<leader>rt', '<cmd>GoTestFile<CR>', { desc = '[R]un Go [T]est' })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
