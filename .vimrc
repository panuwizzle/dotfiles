" === install vimplug before call start
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
"filetype off

call plug#begin('~/.vim/plugged')

" === Language ===
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'

" Typescript
Plug 'leafgarland/typescript-vim'

" === Utility ===
" Git
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nikvdp/ejs-syntax'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/Dockerfile.vim'

" === Color scheme ===
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

""""""""""""""""""""""
" Misc. configuration
""""""""""""""""""""""
set number relativenumber
set ttyfast
set splitright
set hlsearch
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
" if js needs 2 spaces
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype json       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2 expandtab

set si
syntax enable
let mapleader = ","
set encoding=utf-8
"set clipboard=unnamed

"=== Copy to X CLIPBOARD ===
"map <leader>cp :w !xsel -i -p<CR>
"map <leader>cs :w !xsel -i -s<CR>
"map <leader>cb :w !xsel -i -b<CR>
" Paste from X CLIPBOARD
"map <leader>pp :r!xsel -p<CR>
"map <leader>ps :r!xsel -s<CR>
"map <leader>pb :r!xsel -b<CR>

" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
" copy&paste with vim-gtk
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"=== fzf ===
map <leader>z :FZF .<CR>

"'''''''''
" Tagbar
"'''''''
"let g:tagbar_type_elm = {
"      \ 'kinds' : [
"      \ 'f:function:0:0',
"      \ 'm:modules:0:0',
"      \ 'i:imports:1:0',
"      \ 't:types:1:0',
"      \ 'a:type aliases:0:0',
"      \ 'c:type constructors:0:0',
"      \ 'p:ports:0:0',
"      \ 's:functions:0:0',
"      \ ]
"      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Ctags
set tags=tags;/
set laststatus=2

" Turn on the WiLd menu
set wildmenu

" :W sudo saves the file
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

"""""""""""""""""""""""
" UI
""""""""""""""""""""""
"set termguicolors
set background=dark
"set t_Co=256
"colorscheme dracula
colorscheme dracula
"colorscheme snazzy
let g:molokai_original = 1
set guifont=Consolas:h9

"""""""""""""""""""""""
" File type plugin config
"""""""""""""""""""""""
filetype plugin indent on
"filetype on
"filetype plugin on
"filetype indent on

""""""""""""""""""""""
" Omni Complete
""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
""""""""""""""""""""""
" Taglist
""""""""""""""""""""""
let Tlist_Use_Right_Window = 1

"""""""""""""""""""""""""
" Vim airline
"""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
""let g:syntastic_python_checkers = ['pycodestyle']
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
""let g:syntastic_php_checkers = ['php']
"let g:syntastic_php_phpcs_args='--standard=Security -n'

"=== ALE
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


" Javascript
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['tsserver'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'typescript': ['prettier'] }
let g:ale_lint_delay = 500
let g:ale_pattern_options = { '.*node_modules.*$': {'ale_enabled': 0}, '.*dist.*$': {'ale_enabled': 0}, '.*-config.js$': {'ale_enabled': 0} }
let g:ale_set_signs = 1
let g:ale_set_highlights = 1

" Typescript
let g:ale_typescript_tsserver_use_global = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" PHP
"let g:ale_php_phpcs_standard = 'PSR2'
"let g:ale_open_list = 1
"let g:ale_set_quickfix = 1
"autocmd FileType qf setlocal wrap linebreak

" Python config
"let b:ale_fixers = ['black', 'isort']
"let b:ale_fix_on_save = 1
"let g:ale_python_auto_pipenv = 1
"let g:ale_python_black_executable = 'black'

" Elm
"let g:ale_elm_analyse_use_global = 1

""""""""""""""""""""""""
" Neocomplete
"""""""""""""""""""""""
"let g:neocomplete#enable_at_startup = 1

"""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/moo-conf/snippets_custom.json')), "\n"))
let g:user_emmet_settings = {'javascript.jsx' : {'extends' : 'jsx'}}


""""""""""""""""""""""""""
" PHP Namespace \u to add 'use' statement and \e to expand class to full name
""""""""""""""""""""""""""
"function! IPhpInsertUse()
"    call PhpInsertUse()
"    call feedkeys('a',  'n')
"endfunction
"autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
"autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
"
"function! IPhpExpandClass()
"    call PhpExpandClass()
"    call feedkeys('a', 'n')
"endfunction
"autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
"autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" automatically sort the use list
"let g:php_namespace_sort_after_insert = 1

"''''''''''''''''''''''
" ag for ack.vim 
""""""""""""""""""""""
"if executable('ag')
"  "let g:ackprg = 'ag --vimgrep'
"  let g:ackprg = 'ag --nogroup --nocolor --column'
"endif

" auto-command example to apply prettier with gggqG
"autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
