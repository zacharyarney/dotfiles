return {
    'itchyny/lightline.vim',
    enabled = false,
    config = function ()
        vim.g.lightline = {
            colorscheme = 'mentor',
            active = { left = { { 'gitbranch', 'readonly', 'filename', 'modified' } } },
        }
    end
}
