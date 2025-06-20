return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
    'Issafalcon/neotest-dotnet',
  },
  keys = {
    { '<leader>nr', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Run nearest test' },
    { '<leader>nf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Run current file' },
    { '<leader>nd', '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = 'Debug nearest test' },

    { '<leader>nw', '<cmd>lua require("neotest").watch.toggle(vim.fn.expand("%"))<cr>', desc = 'Watch current file' },
    { '<leader>ns', '<cmd>lua require("neotest").summary.toggle()<cr>', desc = 'Toggle neotest summary' },
    { '<leader>no', '<cmd>lua require("neotest").output.open({enter = false, auto_close = true})<cr>', desc = 'Neotest output' },
    { '<leader>nO', '<cmd>lua require("neotest").output_panel.toggle()<cr>', desc = 'Toggle neotest output panel' },
    {
      '<leader>na',
      function()
        -- local blah = vim.fn.getcwd()
        -- require('neotest').run.run(blah)
        require('neotest').run.run { suite = true }
      end,
      desc = 'Run all tests',
    },
  },
  config = function()
    local neotest_golang_opts = {} -- Specify custom configuration

    require('neotest').setup {
      adapters = {
        require 'rustaceanvim.neotest',
        require 'neotest-golang'(neotest_golang_opts), -- Registration
        require 'neotest-dotnet' {
          discovery_root = 'solution',
        },
      },
    }
  end,
}
