runtime bundle/vim-pathogen/autoload/pathogen.vim

set rtp+=/usr/local/opt/fzf

execute pathogen#infect()
call pathogen#helptags()

colorscheme monokain

map <C-n> :NERDTreeToggle<CR>

" Load NERDTREE, then place cursor in other window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p

" Close Vim if NERDTree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Noob Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_shell = "/bin/bash"

" Airline settings
let g:airline_powerline_fonts = 1

" Format Terraform files when saving
let g:terraform_fmt_on_save = 1
