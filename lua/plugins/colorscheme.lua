return {
	"rebelot/kanagawa.nvim",
	build = function()
		print("hello.......")
		vim.cmd("KanagawaCompile")
	end,
	init = function()
		print("init colorschema")
		vim.cmd("colorscheme kanagawa")
	end,
	opts = {
		compile = true,
		transparent = false
	},
	configa = function()
		require("kanagawa").setup({
			compile = true
			
		})
		vim.cmd("colorscheme kanagawa")
	end
}
