" ~/.vim/syntax/bash_colors.vim
if exists("b:current_syntax")
  finish
endif

syn match bashColorVar '^\([A-Z_]\+\)='
syn match bashColorCode '\\\[' nextgroup=bashColorAnsi
syn match bashColorAnsi '\d\+;\?\d*m' contained

hi def link bashColorVar Identifier
hi def link bashColorCode Special
hi def link bashColorAnsi Number

let b:current_syntax = "bash_colors"
