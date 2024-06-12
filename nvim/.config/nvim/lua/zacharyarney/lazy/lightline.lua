return {
    'itchyny/lightline.vim',
    enabled = true,
    config = function ()
        vim.g.lightline = {
            colorscheme = 'mentor',
            active = { left = { { 'gitbranch', 'readonly', 'filename', 'modified' } } },
        }
    end
}
