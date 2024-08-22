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
            'mail',
            'scratch'
        },
        config = function ()
            local za_Pencil = vim.api.nvim_create_augroup(
                'za_Pencil',
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
                    'mail',
                    'scratch'
                },
                callback = function()
                    vim.g['pencil#wrapModeDefault'] = 'soft'
                    vim.fn['pencil#init']({ wrap = 'soft' })
                end,
                group = za_Pencil
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
            'mail',
            'scratch'
        },
        config = function ()
            vim.g['lexical#spell_key'] = '<leader>s'
            vim.g['lexical#dictionary_key'] = '<leader>k'

            local za_Lexical = vim.api.nvim_create_augroup(
                'za_Lexical',
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
                    'mail',
                    'scratch'
                },
                callback = function()
                    vim.fn['lexical#init']()
                end,
                group = za_Lexical
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
            'mail',
            'scratch'
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
            'mail',
            'scratch'
        },
        config = function ()
            local za_TextObjSentence = vim.api.nvim_create_augroup(
                'za_TextObjSentence',
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
                    'mail',
                    'scratch'
                },
                callback = function()
                    vim.fn['textobj#sentence#init']()
                end,
                group = za_TextObjSentence
            })
        end
    },
    {
        'junegunn/goyo.vim',
        config = function ()
            vim.g.goyo_liner = 0
			vim.keymap.set('', 'j', 'gj')
			vim.keymap.set('', 'k', 'gk')
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
