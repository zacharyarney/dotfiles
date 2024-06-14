require('zacharyarney.autocmd')
require('zacharyarney.commands')
require('zacharyarney.remap')
require('zacharyarney.lazy_init')

vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hidden = true
vim.opt.belloff = 'all'
vim.opt.smoothscroll = true
vim.opt.completeopt:append{'menuone', 'noinsert'}
vim.opt.complete:remove{'i'}
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.display:append{'lastline'}
vim.opt.mouse = 'a'
vim.opt.history = 1000
vim.opt.tabpagemax = 50
vim.opt.sessionoptions:remove{'options'}
vim.opt.updatetime = 250
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 100
vim.opt.hlsearch = false
vim.opt.colorcolumn = '80'

-- Cursor default plus blinking
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'


-- Temp file locations
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand('~/.config')
vim.opt.undodir = { prefix .. '/nvim/.undo//'}
vim.opt.backupdir = {prefix .. '/nvim/.backup//'}
vim.opt.directory = { prefix .. '/nvim/.swp//'}


-- Folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldnestmax = 10
vim.opt.foldenable = false


-- Line numbers
vim.opt.number = true


-- Save on buffer leave
vim.opt.autowriteall = true


-- Clipboard yank
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }


-- Set colorscheme
vim.cmd('colorscheme chill-mentor-nvim')
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none' })


-- Statusline
-- vim.opt.statusline = " %f %m %r %w%=%y %l:%c " -- default
