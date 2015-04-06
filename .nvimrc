set nocompatible
filetype off
" Vundle stuff ---------------------------------------------------------------
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#rc("~/.nvim/bundle/")
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
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
Plugin 'henrik/vim-qargs'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
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
set hlsearch
set incsearch " highlight search dynamicaly
" ensure start behavior does not jump to next match
nnoremap * *``
set omnifunc=syntaxcomplete#Complete " enable auto completion popup
set complete=.,w,b,t  
syntax on " activate syntax highlight
set autochdir " change current dir on file open
let g:airline_powerline_fonts=1 "powerline special char required patched font
set laststatus=2 " Activate status line even if one buffer
set foldlevel=99 " Unfold by default
set tags=./tags; " tag file lookup
let mapleader="," " custom leader mapping
let &makeprg = 'upsearch_odoo_makefile && make -f Odoo_makefile' " lookup parent hierachy for a make file
set backspace=2 " backspace yay
set hidden " Allows to switch buffer with changes
set smartcase " Activate subsitute smart case
set number " line number mode
set backupdir=~/.backup,/tmp
set directory=~/.backup,/tmp
let g:multi_cursor_exit_from_insert_mode = 0
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
nnoremap <Leader>b :FufBuffer <CR>
inoremap <expr> § "<C-n>"
nnoremap <expr> § ":"
inoremap jj <ESC>
noremap qw :w
noremap wq :w
map <F9> :make <cr><cr>
map! <F9> :make <cr><cr>
" Python mode setting ---------------------------------------------------------
let g:pymode_virtualenv = 1
let g:pymode_breakpoint_bind = '<Leader>s'
" Clean trailing white lines --------------------------------------------------
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

au BufWritePre * call TrimEndLines()
" Clean trailing white space --------------------------------------------------
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType markdown,yml,c,java,javascript,xml,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" Python mode setup -----------------------------------------------------------
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
" let g:loaded_youcompleteme = 1
" Use arrow to switch slip ---------------------------------------------------
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
