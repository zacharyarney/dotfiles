return {
    enabled = true,
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
    },

    config = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require('fidget').setup({})
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'bashls',
                'clangd',
                'cmake',
                'gopls',
                'lua_ls',
                'marksman',
                'pyright',
                'tsserver',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                ['bashls'] = function()
                    require 'lspconfig'.bashls.setup {
                        capabilities = capabilities,
                    }
                end,

                ['clangd'] = function()
                    require 'lspconfig'.clangd.setup {
                        capabilities = capabilities,
                        cmd = { 'clangd', '--background-index', '--clang-tidy' }
                    }
                end,

                ['cmake'] = function()
                    require 'lspconfig'.cmake.setup {
                        capabilities = capabilities,
                    }
                end,

                ['lua_ls'] = function()
                    require 'lspconfig'.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = 'Lua 5.1' },
                                diagnostics = {
                                    globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
                                }
                            }
                        }
                    }
                end,

                ['gopls'] = function()
                    require 'lspconfig'.gopls.setup {
                        capabilities = capabilities,
                    }
                end,

                ['marksman'] = function()
                    require 'lspconfig'.marksman.setup {
                        capabilities = capabilities,
                    }
                end,

                ['pyright'] = function()
                    require 'lspconfig'.pyright.setup {
                        capabilities = capabilities,
                    }
                end,
                ['tsserver'] = function ()
                    require 'lspconfig'.tsserver.setup {
                        capabilities = capabilities,
                    }
                end
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert', -- remove default noselect
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                }),
        })

        -- disable cmp for writing things
        local za_Cmp = vim.api.nvim_create_augroup(
            'za_Cmp',
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
                cmp.setup.buffer { enabled = false }
            end,
            group = za_Cmp
        })

        -- borders
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

        function vim.lsp.util.open_floating_preview(contents, syntax, funopts, ...)
            funopts = funopts or {}
            funopts.border = funopts.border or 'rounded'
            return orig_util_open_floating_preview( contents, syntax, funopts, ...)
        end

        vim.diagnostic.config({
            --update_in_insert = true,
            float =
                {
                    border = 'rounded',
                    focusable = true,
                    header = '',
                    prefix = '',
                    scope = 'buffer',
                    source = 'always',
                    style = 'minimal',
                },
        })
    end
}
