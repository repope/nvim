require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"


local keymap = vim.keymap.set

keymap("n", "<space><space>x", "<cmd>source %<CR>")
keymap("n", "<space>x", ":.lua<CR>")
keymap("v", "<space>x", ":.lua<CR>")

keymap("n", "<M-j>", "<cmd>cnext<CR>")
keymap("n", "<M-k>", "<cmd>cprev<CR>")
keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
keymap("n", "-", "<cmd>Oil<CR>")
keymap("n", "<leader>tt", "<cmd>Floaterminal<CR>")

--- highlight yanked text ---
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('hmmm', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})


--vim.diagnostic.config({
--  virtual_text = true,
--  signs = false, -- To disable the signs in the sign column
--})


--- terminal ---
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>example", function()
  vim.fn.chansend(job_id, { "ls -al\r\n" })
  --vim.cmd("normal G")
end)

--vim.api.nvim_buf_attac


--tree sitter for funsies
-- vim.cmd [[hi @function.builtin guifg=pink]]
