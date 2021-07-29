" =============================================================================
" Filename: autoload/lightline/colorscheme/mentor.vim
" Author: zacharyarney
" License: MIT License
" Last Change: 2019/03/12 08:37:43.
" =============================================================================
let s:base03 = [ '#262626', 235 ]
let s:base023 = [ '#303030 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#6c6c6c', 242 ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#bcbcbc', 250 ]
let s:base3 = [ '#1c1c1c', 234 ]
let s:yellow = [ '#ffd75f', 221 ]
let s:orange = [ '#d78700', 172 ]
let s:red = [ '#af5f5f', 131 ]
let s:magenta = [ '#5f5f87', 60 ]
let s:blue = [ '#5f87af', 67 ]
let s:cyan = s:blue
let s:green = [ '#5f875f', 65 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base2, s:blue ], [ s:base2, s:base03 ] ]
let s:p.normal.right = [ [ s:base2, s:base03 ], [ s:base2, s:base03 ] ]
let s:p.inactive.right = [ [ s:base00, s:base023 ], [ s:base00, s:base023 ] ]
let s:p.inactive.left =  [ [ s:base00, s:base023 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base2, s:green ], [ s:base2, s:base03 ] ]
let s:p.replace.left = [ [ s:base2, s:red ], [ s:base2, s:base03 ] ]
let s:p.visual.left = [ [ s:base2, s:magenta ], [ s:base2, s:base03 ] ]
let s:p.normal.middle = [ [ s:base2, s:base023 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base023 ] ]
let s:p.tabline.left = [ [ s:base00, s:base3 ] ]
let s:p.tabline.tabsel = [ [ s:base00, s:base3 ] ]
let s:p.tabline.middle = [ [ s:base00, s:base3 ] ]
let s:p.tabline.right = [ [ s:base00, s:base3 ] ]
let s:p.normal.error = [ [ s:base2, s:red ] ]
let s:p.normal.warning = [ [ s:base3, s:yellow ] ]

let g:lightline#colorscheme#mentor#palette = lightline#colorscheme#flatten(s:p)
