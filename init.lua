--print("hello there, we initin now")
--print("ahello there, we initin now")
--print("bhello there, we initin now")

require("config.lazy")

local keymap = vim.keymap.set

keymap("n","<space><space>x", "<cmd>source %<CR>")
keymap("n","<space>x", ":.lua<CR>")
keymap("v","<space>x", ":.lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('hmmm', { clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end
})


