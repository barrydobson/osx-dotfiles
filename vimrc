" vim-plug (https://github.com/junegunn/vim-plug)
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'

Plug 'ntpeters/vim-better-whitespace'

Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'matze/vim-move'
Plug 'terryma/vim-smooth-scroll'
call plug#end()

let mapleader = ","

colorscheme molokai

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Enable hidden buffers
set hidden

" Invisibles settings
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Highlight column 80 and > 120
let &colorcolumn="80,".join(range(120,999),",")

" Display relative line numbers, except absolute current line number
set relativenumber
set number

" Ignore case when searching, except if caps (http://vim.wikia.com/wiki/Searching)
set ignorecase
set smartcase

" Tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Save temporary/backup files in ~/.vim
call system('mkdir -p ~/.vim/{backup,swap,undo}')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file.
if has('persistent_undo')
  set undodir=~/.vim/undo//
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

" Source vimrc after saving
autocmd bufwritepost .vimrc source $MYVIMRC

" Open vimrc in new vsplit
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>

" Window focus
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vim-better-whitespace (https://github.com/ntpeters/vim-better-whitespace)
autocmd BufEnter * EnableStripWhitespaceOnSave

" vim-sneak (https://github.com/justinmk/vim-sneak)
" Map using nmap, not nnoremap. That seems to cause problems.
nmap <Tab> <Plug>Sneak_s
nmap <S-Tab> <Plug>Sneak_S
vmap <Tab> <Plug>Sneak_s
vmap <S-Tab> <Plug>Sneak_S

" vim-move (https://github.com/matze/vim-move)
let g:move_key_modifier = 'C'

" vim-smooth-scroll (https://github.com/terryma/vim-smooth-scroll)
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
