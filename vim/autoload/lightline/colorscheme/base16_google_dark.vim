" =============================================================================
" Filename: autoload/lightline/colorscheme/bright_cyan6_google_dark.vim
" Author: mgoodness
" License: MIT License
" =============================================================================
let s:black = [ '#181818', 0 ]
let s:red = [ '#AB4642', 1 ]
let s:green = [ '#A1B56C', 2 ]
let s:yellow = [ '#F7CA88', 3 ]
let s:blue = [ '#7CAFC2', 4 ]
let s:magenta = [ '#BA8BAF', 5 ]
let s:cyan = [ '#86C1B9', 6 ]
let s:white = [ '#D8D8D8', 7 ]
let s:bright_black = [ '#585858', 8 ]
let s:bright_red = [ '#AB4642', 9 ]
let s:bright_green = [ '#A1B56C', 10 ]
let s:bright_yellow = [ '#F7CA88', 11  ]
let s:bright_blue = [ '#7CAFC2', 12 ]
let s:bright_magenta = [ '#BA8BAF', 13 ]
let s:bright_cyan = [ '#86C1B9', 14 ]
let s:bright_white = [ '#F8F8F8', 15 ]
if &background ==# 'light'
  let [s:bright_black, s:bright_white] = [s:bright_white, s:bright_black]
  let [s:black, s:white] = [s:white, s:black]
  let [s:bright_green, s:bright_cyan] = [s:bright_cyan, s:bright_green]
  let [s:bright_yellow, s:bright_blue] = [s:bright_blue, s:bright_yellow]
endif
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:blue ], [ s:white, s:green ] ]
let s:p.normal.right = [ [ s:black, s:blue ], [ s:black, s:green ] ]
let s:p.inactive.right = [ [ s:black, s:green ], [ s:yellow, s:black ] ]
let s:p.inactive.left =  [ [ s:blue, s:black ], [ s:yellow, s:black ] ]
let s:p.insert.left = [ [ s:white, s:green ], [ s:white, s:green ] ]
let s:p.replace.left = [ [ s:white, s:red ], [ s:white, s:green ] ]
let s:p.visual.left = [ [ s:white, s:yellow], [ s:white, s:green ] ]
let s:p.normal.middle = [ [ s:cyan, s:black ] ]
let s:p.inactive.middle = [ [ s:blue, s:black ] ]
let s:p.tabline.left = [ [ s:white, s:green ] ]
let s:p.tabline.tabsel = [ [ s:white, s:black ] ]
let s:p.tabline.middle = [ [ s:green, s:white ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:white, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#base16_google_dark#palette = lightline#colorscheme#flatten(s:p)
