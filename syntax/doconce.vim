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
syn match doconceKeywords "^Q:\|^Cw:\|Cr:\|^E:\|K:\|L:\|H:\|NP:"

if get(g:, 'vim_markdown_math', 0)
  syn include @tex syntax/tex.vim
  syn region mkdMath start="\\\@<!\$" end="\$" skip="\\\$" contains=@tex keepend
  syn region mkdMath start="\\\@<!\$\$" end="\$\$" skip="\\\$" contains=@tex keepend
endif

hi def link doconceTodos        TODO
hi def link doconceComment      Comment
hi def link doconceKeywords     Keyword
