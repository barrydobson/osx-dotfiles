" vim-plug (https://github.com/junegunn/vim-plug)
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'terryma/vim-smooth-scroll'
call plug#end()

let mapleader = ","

colorscheme molokai
let g:airline_theme='molokai'

" Invisibles settings
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Display relative line numbers, except absolute current line number
set relativenumber
set number

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

" vim-move (https://github.com/matze/vim-move)
let g:move_key_modifier = 'C'

" vim-sneak (https://github.com/justinmk/vim-sneak)
" Map using nmap, not nnoremap. That seems to cause problems.
nmap <Tab> <Plug>Sneak_s
nmap <S-Tab> <Plug>Sneak_S
vmap <Tab> <Plug>Sneak_s
vmap <S-Tab> <Plug>Sneak_S

" vim-smooth-scroll (https://github.com/terryma/vim-smooth-scroll)
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
