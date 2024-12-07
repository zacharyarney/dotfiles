return {
    enabled = false,
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    cmd = 'CopilotChat',
    dependencies = {
        { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
        { 'nvim-telescope/telescope.nvim' }, -- telescope help actions
        { 'nvim-lua/plenary.nvim' },  -- for curl, log wrapper
    },
    config = function(_, opts)
        local chat = require('CopilotChat')
        local cmp = require('CopilotChat.integrations.cmp')
        cmp.setup()

        vim.api.nvim_create_autocmd('BufEnter', {
            pattern = 'copilot-chat',
            callback = function()
                vim.opt_local.relativenumber = false
                vim.opt_local.number = false
            end,
        })

        chat.setup(opts)
    end,
    opts = {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
        context = 'buffers',
        window = {
            layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
            relative = 'editor',
            width = 80,
            col = vim.o.columns - 80,
            height = 0.5,
            row = vim.o.lines - vim.o.lines * 0.5
        },
    },
    keys = function()
        local chat = require('CopilotChat')
        local actions = require('CopilotChat.actions')
        local telescope = require('CopilotChat.integrations.telescope')

        local function createKey(leader, func, desc)
            return {
                leader,
                func,
                desc = desc .. ' (CopilotChat)',
                mode = { 'n', 'v' },
            }
        end

        return {
            createKey('<leader>cc', chat.toggle, 'Toggle'),
            createKey('<leader>cx', chat.reset, 'Clear'),
            createKey('<leader>cq', function()
                local input = vim.fn.input('Quick Chat: ')
                if input ~= '' then
                    chat.ask(input)
                end
            end, 'Quick Chat'),
            createKey('<leader>cd', function()
                telescope.pick(actions.help_actions())
            end, 'Diagnostic Help'),
            createKey('<leader>cp', function()
                telescope.pick(actions.prompt_actions())
            end, 'Prompt Actions'),
        }
    end,
        -- See Commands section for default commands if you want to lazy load on them
}
