return {
  'nicholasmata/nvim-dap-cs',
  dependencies = { 'mfussenegger/nvim-dap' },
  enabled = false,
  config = function()
    -- print 'doooot nooooooot'
    require('dap-cs').setup {
      netcoredbg = {
        -- vim.fn.stdpath 'data' .. '/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer.dll',
        path = vim.fn.stdpath 'data' .. '/mason/bin/netcoredbg',
      },
    }
    require('dap').adapters.netcoredbg = {
      type = 'executable',
      -- command = config.netcoredbg.path,
      command = vim.fn.stdpath 'data' .. '/mason/bin/netcoredbg',
      args = { '--interpreter=vscode' },
    }
  end,
}
