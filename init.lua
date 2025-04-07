--print("hello there, we initin now")
--print("ahello there, we initin now")
--print("bhello there, we initin now")
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
  
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


--tree sitter for funsies
vim.cmd [[hi @function.builtin guifg=yellow]]
