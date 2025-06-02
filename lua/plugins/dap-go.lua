return {
  'leoluz/nvim-dap-go',
  -- config = true,
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = {
    delve = {
      -- On Windows delve must be run attached or it crashes.
      -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
      detached = vim.fn.has 'win32' == 0,
    },
  },
  keys = {
    {
      '<leader>dt',
      function()
        require('dap-go').debug_test()
      end,
      desc = 'Debug test',
    },
    {
      '<leader>dl',
      function()
        require('dap-go').debug_last_test()
      end,
      desc = 'Debug test',
    },
  },
}
