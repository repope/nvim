return {
  'seblyng/roslyn.nvim',
  ft = 'cs',
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    -- your configuration comes here; leave empty for default settings
    -- NOTE: You must configure `cmd` in `config.cmd` unless you have installed via mason
    -- cmd = {
    --   "dotnet",
    --   "/Users/scott/.local/share/nvim/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer.dll",
    --   "--logLevel=Information",
    --   "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    --   "--stdio",
    -- },
  },
}
