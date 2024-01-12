return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap');
            dap.adapters.codelldb = {
                name = "codelldb server",
                type = 'server',
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
                    args = { "--port", "${port}" },
                }
            }

            dap.configurations.cpp = {
              {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
              },
            }

            dap.configurations.c = {
              {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
              },
            }

            require('dap-go').setup()
            vim.keymap.set('n', '<leader><F6>', require 'dap-go'.debug_test)

            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
            table.insert(dap.configurations.python, {
                name = 'python-debug',
                type = 'python',
                request = 'launch',
                program = '${file}',
                justMyCode = false,
            })


            require("dap-vscode-js").setup({
              -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
              --debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
              --debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
              adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
              -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
              -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
              -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
            })

            for _, language in ipairs({ "typescript", "javascript" }) do
              require("dap").configurations[language] = {
                  {
                      type = 'pwa-node',
                      request = 'launch',
                      name = 'Launch file',
                      program = '${file}',
                      cwd = '${workspaceFolder}'
                  },
                  {
                      type = 'pwa-node',
                      request = 'attach',
                      name = 'Attach',
                      program = require('dap.utils').pick_process,
                      cwd = '${workspaceFolder}'
                  },
                  {
                      type = "pwa-node",
                      request = "launch",
                      name = "Debug Jest Tests",
                      trace = true, -- include debugger info
                      runtimeExecutable = "node",
                      runtimeArgs = {
                          "../node_modules/jest/bin/jest.js"
                      },
                      rootPath = "${workspaceFolder}",
                      cwd = "${workspaceFolder}",
                      console = "integratedTerminal",
                      internalConsoleOptions = "neverOpen",
                  },
                  {
                      type = 'pwa-node',
                      request = 'launch',
                      name = 'Launch Test Current File (pwa-node with jest)',
                      cwd = vim.fn.getcwd(),
                      runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
                      runtimeExecutable = 'node',
                      args = { '${file}', '--coverage', 'false'},
                      rootPath = '${workspaceFolder}',
                      sourceMaps = true,
                      console = 'integratedTerminal',
                      internalConsoleOptions = 'neverOpen',
                      skipFiles = { '<node_internals>/**', 'node_modules/**' },
                  },
            }
            end

            vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped',{ text ='👉', texthl ='', linehl ='', numhl =''})
            vim.fn.sign_define('DapBreakpointCondition', { text='🔶', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected', { text='💩', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', { text='📜', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })

            vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            vim.keymap.set('n', '<leader><F5>', function() require('dap').terminate() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
        end
    },
    {
        'leoluz/nvim-dap-go'
    },
    {
        'mxsdev/nvim-dap-vscode-js'
    },
    {
        'mfussenegger/nvim-dap-python'
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap'
        },
        config = function()
            require('dapui').setup({});
            vim.keymap.set('n', '<F8>', require 'dapui'.toggle)
            vim.keymap.set('i', '<F8>', require 'dapui'.toggle)
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end
    },
    {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
    }
}
