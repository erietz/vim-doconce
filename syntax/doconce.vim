" Vim syntax file
" Language:     Doconce
" Maintainer:   Ethan Rietz
" Filenames:    *.do *.do.txt
" Last Change:  2020 Aug 26

"
" Match TODO comments
syntax keyword doconceTodos TODO XXX FIXME NOTE

syn match doconceComment "^#.*$"

syn match doconceKeywords "^!bc\|^!ec"
syn match doconceKeywords "^!bt\|^!et"
syn match doconceKeywords "^!bquiz\|^!equiz"
syn match doconceKeywords "^Q:\|^Cw:\|Cr:"


highlight default link doconceComment Comment
hi def link doconceKeywords              Keyword
hi def link doconceTodos                 TODO
