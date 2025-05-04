return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
      -- {  "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files in cwd" },
      -- {  "<leader>fg", "<cmd>FzfLua live_grep_glob<cr>", desc = "Find files in cwd" }
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "[F]ind [F]iles in cwd" },
      { "<leader>fc", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config")}) end, desc = "[F]ind [C]onfig nvim files" },
      { "<leader>fg", function() require("fzf-lua").live_grep_glob({glob_separator = "%s%s"}) end, desc = "[F]ind Live [G]rep files in cwd" },
      {  "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "[F]ind neovim [H]elp" },
      { "<leader>fb", function() require("fzf-lua").builtin() end, desc = "[F]ind builtin commands" },
      { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "[F]ind current [W]ord" },
      { "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "[F]ind current [W]ORD" },
      { "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "[F]ind [D]iagnostics" },
      { "<leader>fr", function() require("fzf-lua").resume() end, desc = "[F]ind [R]esume" },
      { "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "[F]ind [O]ld Files" },
      { "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "[ ] Find [B]uffers" },
      { "<leader>/", function() require("fzf-lua").lgrep_curbuf() end, desc = "[/] Live grep the current buffer" },
    }
  }
}
