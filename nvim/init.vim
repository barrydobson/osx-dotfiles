" vim-plug (https://github.com/junegunn/vim-plug)
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

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
Plug 'ervandew/supertab'

Plug 'hashivim/vim-terraform'
Plug 'dag/vim-fish'
call plug#end()

let mapleader = ","

let base16colorspace=256
colorscheme base16-summerfruit-dark

" Enable hidden buffers
set hidden

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

" Set mapping & keycode delays
" set timeoutlen=1000
" set ttimeoutlen=10

" Invisibles settings
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Highlight column 80 and > 120
let &colorcolumn="80,".join(range(120,999),",")

" Toggle paste
set pastetoggle=<F2>

" Use system clipboard
set clipboard=unnamed

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

" Create persistence directories
call system('mkdir -p ~/.local/share/nvim/{backup,swap,undo}')

" Keep undo history across sessions by storing it in a file.
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

" Source vimrc after saving
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" Open vimrc in new vsplit
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>

" No Ex mode
nnoremap Q <nop>

" Window focus
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" YAML tabs
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" vim-better-whitespace (https://github.com/ntpeters/vim-better-whitespace)
autocmd BufEnter * EnableStripWhitespaceOnSave

" vim-sneak (https://github.com/justinmk/vim-sneak)
" Map using nmap, not nnoremap. That seems to cause problems.
nmap <Tab> <Plug>Sneak_s
nmap <S-Tab> <Plug>Sneak_S
vmap <Tab> <Plug>Sneak_s
vmap <S-Tab> <Plug>Sneak_S

" vim-move (https://github.com/matze/vim-move)
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
set <F20>=j
set <F21>=k
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

" vim-smooth-scroll (https://github.com/terryma/vim-smooth-scroll)
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

" Lightline
let g:lightline = {
    \ 'colorscheme': 'base16',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'readonly': 'LightlineReadonly',
    \   'modified': 'LightlineModified',
    \   'filename': 'LightlineFilename'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
