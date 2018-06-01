" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876

" create persistence directories
call system('mkdir -p ~/.local/share/nvim/{backup,swap,undo}')

" vim-plug (https://github.com/junegunn/vim-plug)
" automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-signify'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

Plug 'godlygeek/tabular'    " must come before plasticboy/vim-markdown
Plug 'AndrewRadev/splitjoin.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'          " required to support tag finding in vim-go
Plug 'mileszs/ack.vim'

Plug 'matze/vim-move'
Plug 'terryma/vim-smooth-scroll'

" Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'sebdah/vim-delve'

Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'dag/vim-fish'
Plug 'plasticboy/vim-markdown'
call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set completeopt-=preview          " remove the preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expand tabs to spaces
set hidden                        " enable hidden buffers
set ignorecase                    " ignore case when searching
set listchars=tab:▸\ ,eol:¬
set noerrorbells                  " disable bells
set nohlsearch                    " disable search highlighting
set noshowmode                    " hide the default mode text
set novisualbell
set nowrap
set number                        " show number ruler
set pastetoggle=<F2>              " toggle paste
set relativenumber                " show relative numbers in the ruler
set shiftwidth=2
set smartcase                     " don't ignore mixed-case when searching
set smartindent                   " enable smart indentation
set softtabstop=2
set splitbelow                    " set window splits
set splitright
set tabstop=2

" keep undo history across sessions by storing it in a file.
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

let mapleader = ","

" autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"----------------------------------------------
" Colors
"----------------------------------------------
let base16colorspace=256
colorscheme base16-summerfruit-dark
let &colorcolumn="80,".join(range(120,999),",") " highlight column 80 and > 120

"----------------------------------------------
" Vimrc editing
"----------------------------------------------
" Source vimrc after saving
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" Open vimrc in new vsplit
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<CR>

"----------------------------------------------
" Macro editing
"----------------------------------------------
" http://www.jarrodctaylor.com/posts/Vim-Easily-Edit-Macros/
function! EditMacro()
  call inputsave()
  let g:regToEdit = input('Register to edit: ')
  call inputrestore()
  execute "nnoremap <Plug>em :let @" . eval("g:regToEdit") . "='<C-r><C-r>" . eval("g:regToEdit")
endfunction

nmap <Leader>em :call EditMacro()<CR> <Plug>em

"----------------------------------------------
" Mappings
"----------------------------------------------
" toggle current fold open/closed
nnoremap <Space> za

" toggle invisibles
nnoremap <Leader>l :set list!<CR>

" quickfix navigation
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"----------------------------------------------
" Plugin: https://github.com/plasticboy/vim-markdown
"----------------------------------------------
let g:vim_markdown_folding_disabled = 1           " disable folding
let g:vim_markdown_toc_autofit = 1                " auto-shrink the TOC

"----------------------------------------------
" Plugin: https://github.com/w0rp/ale
"----------------------------------------------
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

"----------------------------------------------
" Plugin: https://github.com/Shougo/deoplete.nvim
"----------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"----------------------------------------------
" Plugin: https://github.com/nathanaelkane/vim-indent-guides
"----------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
highlight IndentGuidesOdd ctermbg=Black
highlight IndentGuidesEven ctermbg=18

"----------------------------------------------
" Plugin: https://github.com/matze/vim-move
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
"----------------------------------------------
set <F20>=j
set <F21>=k
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp

"----------------------------------------------
" Plugin: https://github.com/terryma/vim-smooth-scroll
"----------------------------------------------
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

"----------------------------------------------
" Plugin: https://github.com/itchyny/lightline.vim
" Plugin: https://github.com/maximbaz/lightline-ale
"----------------------------------------------
let g:lightline = {
    \ 'active': {
    \   'left': [['mode', 'paste'], ['fugitive', 'filename']],
    \		'right': [['linter_errors', 'linter_warnings', 'linter_ok'],
		\							['percent', 'lineinfo'],
		\		 					['fileformat', 'fileencoding', 'filetype']]
    \ },
    \ 'colorscheme': 'base16',
    \ 'component_expand': {
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \   'linter_warnings': 'lightline#ale#warnings'
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'fugitive': 'LightlineFugitive',
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly'
    \ },
    \ 'component_type': {
    \   'linter_errors': 'error',
    \   'linter_warnings': 'warning'
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

"----------------------------------------------
" Plugin: https://github.com/ctrlpvim/ctrlp.vim
"----------------------------------------------
let g:ctrlp_map = ''        " disable, since we want to use FZF instead

"----------------------------------------------
" Plugin: https://github.com/junegunn/fzf.vim
"----------------------------------------------
nnoremap <C-p> :FZF<CR>

"----------------------------------------------
" Plugin: https://github.com/mileszs/ack.vim
"----------------------------------------------
let g:ackprg = 'ag --vimgrep'
nnoremap <Leader>a :Ack!<Space>

"----------------------------------------------
" Language: Bash
"----------------------------------------------
autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"----------------------------------------------
" Language: Fish
"----------------------------------------------
autocmd FileType fish setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"----------------------------------------------
" Language: Go
"----------------------------------------------
autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" mappings
autocmd Filetype go nmap <Leader>ga <Plug>(go-alternate-edit)
autocmd Filetype go nmap <Leader>gah <Plug>(go-alternate-split)
autocmd Filetype go nmap <Leader>gav <Plug>(go-alternate-vertical)
autocmd FileType go nmap <Leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>gd <Plug>(go-def)
autocmd FileType go nmap <Leader>gdh <Plug>(go-def-split)
autocmd FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>gD <Plug>(go-doc)
autocmd FileType go nmap <Leader>gDv <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>gm :GoMetaLinter<CR>
autocmd FileType go nmap <Leader>gr <Plug>(go-run)
autocmd FileType go nmap <Leader>gt <Plug>(go-test)
autocmd FileType go nmap <Leader>gto :GoDeclsDir<CR>

" show type information
let g:go_auto_type_info = 1

" syntax highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" highlight variable uses
let g:go_auto_sameids = 1

" show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" run goimports when running gofmt
let g:go_fmt_command = "goimports"

" gometalinter
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" set whether the JSON tags should be snakecase or camelcase
let g:go_addtags_transform = "snakecase"

"----------------------------------------------
" Language: JSON
"----------------------------------------------
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"----------------------------------------------
" Language: Make
"----------------------------------------------
autocmd FileType make setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType markdown setlocal syntax=markdown

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"----------------------------------------------
" Language: YAML
"----------------------------------------------
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
