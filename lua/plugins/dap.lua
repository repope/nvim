--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'nicholasmata/nvim-dap-cs',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<leader>gb',
      function()
        require('dap').run_to_cursor()
      end,
      desc = 'Debug: Run to curser',
    },
    {
      '<leader>?',
      function()
        require('dapui').eval(nil, { enter = true })
      end,
      desc = 'Debug: eval var under cursor',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
    {
      '<leader>dm',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: current main file',
    },
    {
      '<leader>dro',
      function()
        -- require('dap').repl.open()
        require('dapui').open { layout = 2 }
      end,
      desc = 'Debug: open repl',
    },
    {
      '<leader>drc',
      function()
        -- require('dap').repl.close()
        require('dapui').close { layout = 2 }
      end,
      desc = 'Debug: close repl',
    },
    -- {
    --   '<leader>dco',
    --   function()
    --     require('dap').console.open()
    --   end,
    --   desc = 'Debug: open console',
    -- },
    -- {
    --   '<leader>dcc',
    --   function()
    --     require('dap').console.close()
    --   end,
    --   desc = 'Debug: close console',
    -- },
    -- {
    --   '<leader>dt',
    --   function()
    --     require('dap').debug_test()
    --   end,
    --   desc = 'Debug testz',
    -- },
    -- {
    --   '<leader>tt',
    --   function()
    --     require('dap-go').debug_test()
    --   end,
    --   desc = 'Debug test',
    -- },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        -- 'netcoredbg',
      },
    }

    require('nvim-dap-virtual-text').setup {}

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }
    -- require('dap-cs').setup()

    -- local dap = require 'dap'

    -- dap.adapters.coreclr = {
    --   type = 'executable',
    --   command = vim.fn.stdpath 'data' .. '/mason/bin/netcoredbg',
    --   args = { '--interpreter=vscode' },
    -- }
    -- dap.configurations.cs = {
    --   {
    --     type = 'coreclr',
    --     name = 'launch - netcoredbg',
    --     request = 'launch',
    --     program = function()
    --       return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net9.0', 'file')
    --     end,
    --   },
    -- }
    -- configure codelldb adapter
    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
      },
    }

    -- setup a debugger config for zig projects
    dap.configurations.zig = {
      {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}
