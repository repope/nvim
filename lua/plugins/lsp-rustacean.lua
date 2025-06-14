return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  -- enabled = false,
  config = function()
    -- vim.g.rustaceanvim.tools.test_executor = 'background'
    vim.g.rustaceanvim = {
      tools = {
        -- test_executor = 'background',
      },
    }

    vim.keymap.set('n', '<leader>rt', function()
      vim.cmd.RustLsp 'testables'
    end, { desc = 'Rustacean testables' })

    vim.keymap.set('n', '<leader>rd', function()
      vim.cmd.RustLsp 'debug'
    end, { desc = 'Rustacean debug' })
  end,
}
