return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  zopts = {},
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "c", "lua", "vim", "vimdoc", "query", "c_sharp", "javascript", "html" 
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      --auto_install = true
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>", --"gnn", -- set to `false` to disable one of the mappings
          node_incremental = "<Enter>", --"grn",
          scope_incremental = false, --"<Enter>", --"grc",
          node_decremental = "<Backspace>", --"grm",
        },
      }
    })
  end
}
