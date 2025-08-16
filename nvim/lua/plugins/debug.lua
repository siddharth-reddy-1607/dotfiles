return{
    "mfussenegger/nvim-dap",
    dependencies= {
        'rcarriga/nvim-dap-ui',
        'mfussenegger/nvim-dap-python'
    },
    config=function ()
        local dap = require('dap')
        local dapui = require('dapui')
        require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        require('dapui').setup()
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<leader>dc', dap.continue, {})
        vim.keymap.set('n', '<leader>ov', function() require('dap').step_over() end)
        vim.keymap.set('n', '<leader>in', function() require('dap').step_into() end)
        vim.keymap.set('n', '<leader>ot', function() require('dap').step_out() end)
        -- vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
        -- vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        -- vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
        -- vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
        -- vim.keymap.set({'n', 'v'}, '<leader>dh', function()
        --     require('dap.ui.widgets').hover()
        -- end)
        -- vim.keymap.set({'n', 'v'}, '<leader>dp', function()
        --     require('dap.ui.widgets').preview()
        -- end)
        -- vim.keymap.set('n', '<leader>df', function()
        --     local widgets = require('dap.ui.widgets')
        --     widgets.centered_float(widgets.frames)
        -- end)
        -- vim.keymap.set('n', '<leader>ds', function()
        --     local widgets = require('dap.ui.widgets')
        --     widgets.centered_float(widgets.scopes)
        -- end)
        -- local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
