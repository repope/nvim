-- vim.keymap.set('n', '<leader>rt', function()
--   vim.cmd 'wa'
--   vim.cmd 'GoTestFile'
-- end, { desc = '[R]un Go [T]est' })
-- vim.keymap.set('n', '<leader>rt', '<cmd>GoTestFile<CR>', { desc = '[R]un Go [T]est' })
vim.api.nvim_buf_set_keymap(
  0, -- Buffer number: 0 means the current buffer
  'n', -- Mode: 'n' for normal mode
  '<leader>rt', -- Key sequence to map (e.g., leader + t)
  '<cmd>GoTestFile<CR>', -- Command to execute (e.g., from a Go plugin like vim-go)
  { -- Options table
    noremap = true, -- Don't remap recursively
    silent = true, -- Don't echo the command
    -- buffer = true, -- IMPORTANT: Make this mapping buffer-local
    desc = 'go go go',
  }
)
-- print 'hellllllloooooooo'
