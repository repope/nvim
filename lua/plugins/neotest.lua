return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>nr', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Run nearest test' },
    { '<leader>nf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Run current file' },
    { '<leader>nd', '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = 'Debug nearest test' },

    { '<leader>nw', '<cmd>lua require("neotest").watch.toggle(vim.fn.expand("%"))<cr>', desc = 'Watch current file' },
    { '<leader>ns', '<cmd>lua require("neotest").summary.toggle()<cr>', desc = 'Toggle neotest summary' },
  },
}
