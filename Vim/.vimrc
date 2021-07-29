set nocompatible
func! WordProcessorMode()
    " movement changes
    map j gj
    map k gk
    " formatting text
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    " spelling and thesaurus
    setlocal spell spelllang=en_us
    set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
    " complete+=s makes autocompletion search the thesaurus
    set complete+=s
endfu

filetype plugin on
runtime macros/matchit.vim
set nopaste
set autoread

" line numbers and autotoggle on buffer focus
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set hidden

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
" set foldlevel=2

" SHIFT-TAB functionality
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
set complete-=i

    " Bracket handling
    " noremap ( ()<Esc>i
    " noremap [ []<Esc>i
    " noremap { {}<Esc>i
    " inoremap < <><Esc>i
    " inoremap ' ''<Esc>i
    " inoremap " ""<Esc>i
    " bracket enter
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap {<CR> {<CR>}<Esc>O
    " inoremap <<CR> <<CR>><Esc>O
" excaping brackets etc with Ctrl-j
:inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
" add brackets etc around highlighted text with \ leader
:vnoremap \( <Esc>`>a)<Esc>`<i(<Esc>
:vnoremap \[ <Esc>`>a]<Esc>`<i[<Esc>
:vnoremap \{ <Esc>`>a}<Esc>`<i{<Esc>
    " :vnoremap \< <Esc>`>a><Esc>`<i<<Esc>
:vnoremap \' <Esc>`>a'<Esc>`<i'<Esc>
:vnoremap \" <Esc>`>a"<Esc>`<i"<Esc>

set ruler
set laststatus=2
set scrolloff=5
set sidescrolloff=5
set display+=lastline
set mouse=a
set bs=indent,eol,start
set hlsearch
set incsearch
set wildmenu
set history=1000
set tabpagemax=50
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" clipboard yank compatibility for OSX/Linux to be safe I guess
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

set sessionoptions-=options " prevents plugins etc from overriding .vimrc
set updatetime=750

" nvim wait time between keypresses for commands like 'jk'
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif


" Language specific tabs
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab

syntax enable

"Remaps Esc to 'jk' in insert mode
inoremap fd <Esc>

" for vim 7
set t_Co=256

" for vim 8
" !! THIS BREAKS NEOVIM IN OSX TERMINAL APP !!
" if has("termguicolors")
"     set termguicolors
" endif

" Lightline config
let g:lightline = {
    \ 'colorscheme': 'mentor',
    \ }
set noshowmode

" Colorscheme obviously
augroup Nord
    autocmd!
    autocmd ColorScheme nord highlight CursorLineNr guifg=#E5E9F0 ctermfg=7
augroup end
let g:nord_italic = 1
let g:nord_comment_brightness = 20
colorscheme mentor


" ----- VIM-PLUG SECTION -----


" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins go between these begin and end calls
call plug#begin('~/.vim/installed-plugins')
" Autocomplete 
    " If ever need to reinstall YCM, run following commands after to compile
    " cd ~/.vim/installed-plugins/youcompleteme
    " ./install.py --all
    " ./install.py --clang-completer
Plug 'valloric/youcompleteme'

" Python mode better syntax highlighting for python
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Better syntax highlighting and other improvements for JS
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" Prettier for web dev related formatting -- post global install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Better syntax highlighting etc. for HTML5
Plug 'othree/html5.vim'

" Better statusline
Plug 'itchyny/lightline.vim'

" Git diff in gutter
Plug 'airblade/vim-gitgutter'

" Vinegar file browser
Plug 'tpope/vim-vinegar'

" Vim Surround paren, quote, tag handling
Plug 'tpope/vim-surround'

" Vim Markdown support
" tabularize is required for table formatting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" fzf Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" indentation lines
Plug 'Yggdroot/indentLine'

" Nord theme
    " Plug 'arcticicestudio/nord-vim'

" Oceanic Next theme
    " Plug 'mhartington/oceanic-next'

call plug#end()

" ----- end vim-plug section -----

    " Potential fix for random line in python files with Python Mode
    " let g:pymode_options_colorcolumn = 0

    " Potential fix for Python Mode python source
    " let g:pymode_python = 'python3'

    " enable all syntax highlighting features for python
    " let g:python_highlight_all = 1

    " indentLine match colorscheme
    " let g:indentLine_setColors = 0

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/installed-plugins/youcompleteme/.ycm_extra_conf.py'

" <leader>HOTKEYS
let mapleader = " "

" NeoVim terminal mode
nnoremap <leader>T :terminal<cr>

" Python Mode hotkeys
nnoremap <leader>pal :PymodeLintAuto<cr>

" Word Processor Mode
nnoremap <leader>wp :call WordProcessorMode()<cr>

" :Find fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>hh :History<cr>

" fzf config
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

