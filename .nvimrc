set nocompatible
filetype off
" Vundle stuff ---------------------------------------------------------------
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#rc("~/.nvim/bundle/")
call vundle#begin()
Plugin 'klen/python-mode'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on
filetype plugin on
" Snippets -------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Tab beavhiour --------------------------------------------------------------
set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=2     " a hard TAB displays as 2 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
" Syntax check ---------------------------------------------------------------
let g:pymode_lint = 0 " Disable Python mode check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" General behavior -----------------------------------------------------------
"set hlsearch
set incsearch " highlight search dynamicly
" ensure start behavior does not jump to next match
nnoremap * *``
" set omnifunc=syntaxcomplete#Complete " enable auto completion popup
syntax on " activate syntax highlight
set autochdir " change current dir on file open
let g:airline_powerline_fonts=1 "powerline special char required patched font
set laststatus=2 " Activate status line even if one buffer
set foldlevel=99 " Unfold by default
set tags=./tags; " tag file lookup
let mapleader="," " custom leader mapping
let &makeprg = 'upsearch_makefile && make' " lookup parent hierachy for a make file
set backspace=2 " backspace yay
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing white spaces
set hidden " Allows to switch buffer with changes
set smartcase " Activate subsitute smart case
set number " line number mode
" Color Sheme -----------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme solarized
" Disable GUI noise  ----------------------------------------------------------
:set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
" Custom key bindings ---------------------------------------------------------
noremap <Leader>e :FufFile <CR>
nnoremap <Leader>s :FufBuffer <CR>
" Clean trailing white lines --------------------------------------------------
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

au BufWritePre * call TrimEndLines()
