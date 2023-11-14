set nocompatible

" <leader>HOTKEYS
let mapleader = " "

function WordProcessorMode()
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
endfunction

function Scratch()
    execute "enew"
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
endfunction

filetype plugin on
runtime macros/matchit.vim
set nopaste
set autoread

" set number
" line numbers and autotoggle on buffer focus
" set number relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set hidden
set belloff=all

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

" Templates for filetypes included in ~/.vim/templates/skeleton.*
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
augroup END


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
colorscheme darkMentor


" ----- VIM-PLUG SECTION -----

" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins go between these begin and end calls
call plug#begin('~/.vim/installed-plugins')

" File linking and project structure for creative writing
Plug 'vimwiki/vimwiki'
" Writing tools
Plug 'preservim/vim-pencil'
" Better spell-check
Plug 'preservim/vim-lexical'
" Autocorrect
Plug 'preservim/vim-litecorrect'
" Better sentence detection
Plug 'preservim/vim-textobj-sentence'
Plug 'kana/vim-textobj-user' " dependency for vim-textobj-sentence
" Uncover usage problems in your writing
Plug 'preservim/vim-wordy'
" Power tool for shredding text in Insert mode
Plug 'preservim/vim-wordchipper'
" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Autocomplete 
    " If ever need to reinstall YCM, run following commands after to compile
    " cd ~/.vim/installed-plugins/youcompleteme
    " ./install.py --all
    " ./install.py --clang-completer
" Plug 'valloric/youcompleteme'

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

" clang-format, a formatter for C, C++, Obj-C, Java, JS, TS and ProtoBuf
Plug 'rhysd/vim-clang-format'

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" indentation lines
Plug 'Yggdroot/indentLine'

" tmux pane nav integration
Plug 'christoomey/vim-tmux-navigator'
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

" VimWiki config
nmap <Nop> <Plug>VimwikiRemoveHeaderLevel
" let g:vimwiki_list = [
"     \{'path': '~/projects/work/notes/', 'name': 'Notes',  'syntax': 'markdown', 'ext': '.md', 'index': 'index'},
" \]
let g:vimwiki_list = [
    \{'path': '~/projects/work/notes/', 'name': 'Notes',  'syntax': 'markdown', 'ext': '.md', 'index': 'index'},
    \{'path': '~/projects/work/palo_alto/', 'name': 'Palo Alto',  'syntax': 'markdown', 'ext': '.md', 'index': 'index'},
    \{'path': '~/projects/work/poetry/', 'name': 'Poetry',  'syntax': 'markdown', 'ext': '.md', 'index': 'index'},
    \{'path': '~/projects/work/songs/', 'name': 'Songs',  'syntax': 'markdown', 'ext': '.md', 'index': 'index'},
\]
let g:vimwiki_global_ext = 0 " only treat files in vimwiki directory list as part of VimWiki

" Pencil config
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#sentence#init()
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#sentence#init()
  autocmd FileType vimwiki      call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#sentence#init()
  autocmd FileType mail         call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#sentence#init()
augroup END

" Goyo config
nnoremap <leader>g :Goyo<cr>
" autocmd FileType markdown,mkd Goyo 80
" autocmd FileType text         Goyo 80
" autocmd FileType vimwiki      Goyo 80

" autocmd BufEnter *.md  :Goyo 80
" autocmd BufEnter *.txt :Goyo 80

" function! s:goyo_enter()
"   let b:quitting = 0
"   let b:quitting_bang = 0
"   autocmd QuitPre <buffer> let b:quitting = 1
"   cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
" endfunction
" 
" function! s:goyo_leave()
"   " Quit Vim if this is the only remaining buffer
"   if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
"     if b:quitting_bang
"       qa!
"     else
"       qa
"     endif
"   endif
" endfunction
" 
" autocmd! User GoyoEnter call <SID>goyo_enter()
" autocmd! User GoyoLeave call <SID>goyo_leave()

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/installed-plugins/youcompleteme/.ycm_extra_conf.py'

" NeoVim terminal mode
nnoremap <leader>T :terminal<cr>

" Python Mode hotkeys
nnoremap <leader>pal :PymodeLintAuto<cr>

" Word Processor Mode
nnoremap <leader>wp :call WordProcessorMode()<cr>

" Create new scratch buffer
nnoremap <leader>ns :call Scratch()<cr>

" clang-format config
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
let g:clang_format#auto_format = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" vim-markdown config
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1

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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --color=never --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" '.shellescape(<q-args>), 1, <bang>0)
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
