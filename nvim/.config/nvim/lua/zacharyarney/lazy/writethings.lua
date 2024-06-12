return {
    {
        'preservim/vim-pencil',
        ft = {
            'markdown',
            'mkd',
            'pandoc',
            'mom',
            'roff',
            'text',
            'vimwiki',
            'mail'
        },
        config = function ()
            local zacharyarney_Pencil = vim.api.nvim_create_augroup(
                'zacharyarney_Pencil',
                { clear = true }
            )

            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'markdown',
                    'mkd',
                    'pandoc',
                    'mom',
                    'roff',
                    'text',
                    'vimwiki',
                    'mail'
                },
                callback = function()
                    vim.g['pencil#wrapModeDefault'] = 'soft'
                    vim.fn['pencil#init']({ wrap = 'soft' })
                end,
                group = zacharyarney_Pencil
            })
        end
    },
    {
        'preservim/vim-lexical',
        ft = {
            'markdown',
            'mkd',
            'pandoc',
            'mom',
            'roff',
            'text',
            'vimwiki',
            'mail'
        },
        config = function ()
            vim.g['lexical#spell_key'] = '<leader>s'
            vim.g['lexical#dictionary_key'] = '<leader>k'

            local zacharyarney_Lexical = vim.api.nvim_create_augroup(
                'zacharyarney_Lexical',
                { clear = true }
            )

            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'markdown',
                    'mkd',
                    'pandoc',
                    'mom',
                    'roff',
                    'text',
                    'vimwiki',
                    'mail'
                },
                callback = function()
                    vim.fn['lexical#init']()
                end,
                group = zacharyarney_Lexical
            })
        end
    },
    {
        'preservim/vim-litecorrect',
        ft = {
            'markdown',
            'mkd',
            'pandoc',
            'mom',
            'roff',
            'text',
            'vimwiki',
            'mail'
        }
    },
    {
        'preservim/vim-textobj-sentence',
        dependencies = { 'kana/vim-textobj-user' },
        ft = {
            'markdown',
            'mkd',
            'pandoc',
            'mom',
            'roff',
            'text',
            'vimwiki',
            'mail'
        },
        config = function ()
            local zacharyarney_TextObjSentence = vim.api.nvim_create_augroup(
                'zacharyarney_TextObjSentence',
                { clear = true }
            )

            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'markdown',
                    'mkd',
                    'pandoc',
                    'mom',
                    'roff',
                    'text',
                    'vimwiki',
                    'mail'
                },
                callback = function()
                    vim.fn['textobj#sentence#init']()
                end,
                group = zacharyarney_TextObjSentence
            })
        end
    },
    {
        'junegunn/goyo.vim',
        config = function ()
            vim.g.goyo_liner = 0
            vim.keymap.set('n', '<leader>G', ':Goyo<CR>', { noremap = true, silent = true })
        end
    },
    {
        'junegunn/limelight.vim',
        config = function ()
            vim.keymap.set({ 'n', 'v' }, '<leader>L', ':Limelight!!<CR>', { noremap = true, silent = true })
        end
    },
}
