" Vim syntax file
" Language:     Doconce
" Maintainer:   Ethan Rietz
" Filenames:    *.do *.do.txt


" Match TODO comments
syntax keyword doconceTodos TODO XXX FIXME NOTE

syn match doconceComment "^#.*$"

syn region doconceComment start=/\[\w*:/ end=/.*\]/

syn match doconceAbstract /^__Abstract.__$/


syn region foobar oneline matchgroup=doconcePreambleKey start=/^TITLE:\|^AUTHOR:\|^DATE:/ matchgroup=doconcePreambleVal end=/.*/
syn region foobar oneline matchgroup=doconcePreambleKey start=/^TOC:/ matchgroup=doconcePreambleVal end="on\|off"

syn region doconceHeadingText matchgroup=doconceHeading start=/^======= / end=/ =======$/ contains=ALLBUT,doconcePreamble
syn region doconceHeadingText matchgroup=doconceHeading start=/^===== / end=/ =====$/ contains=ALLBUT,doconcePreamble
syn region doconceHeadingText matchgroup=doconceHeading start=/^=== / end=/ ===$/ contains=ALLBUT,doconcePreamble

syn match doconceList "^ *\* \|^ *o "
syn region foobar oneline matchgroup=doconceFigureKey start=/^FIGURE:/ matchgroup=doconceFigureVal end=/\[.*\]/

syn match doconceEmphasis /_[^_]\+_/
syn match doconceEmphasis /\*[^*]\+\*/
syn match doconceEmphasis /`[^`]\+`/

syn match doconceQuote /``.\+''/

syn match doconceQuizKeyword "^Q:\|^Cw:\|^Cr:\|^E:\|^K:\|^L:\|^H:\|^NP:" contained
syn region doconceQuizDelim matchgroup=doconceContainer start=/^!bquiz/ end=/^!equiz/ fold transparent contains=ALLBUT,doconcePreamble

syn region doconceCodeDelim matchgroup=doconceContainer start=/^!bc/ end=/^!ec/ fold transparent contains=ALLBUT,doconcePreamble,doconceQuizKeyword
syn region doconceTexDelim matchgroup=doconceContainer start=/^!bt/ end=/^!et/ fold transparent contains=ALLBUT,doconcePreamble,doconceQuizKeyword

" LaTeX: {{{3
" Set embedded LaTex (doconce extension) highlighting
" Unset current_syntax so the 2nd include will work
" unlet b:current_syntax
syn include @LATEX syntax/tex.vim
syn region doconceLaTeXInlineMath start=/\v\\@<!\$\S@=/ end=/\v\\@<!\$\d@!/ keepend contains=@LATEX
syn region doconceLaTeXInlineMath start=/\\\@<!\\(/ end=/\\\@<!\\)/ keepend contains=@LATEX
syn match doconceEscapedDollar /\\\$/ conceal cchar=$
syn match doconceProtectedFromInlineLaTeX /\\\@<!\${.*}\(\(\s\|[[:punct:]]\)\([^$]*\|.*\(\\\$.*\)\{2}\)\n\n\|$\)\@=/ display
" contains=@LATEX
syn region doconceLaTeXMathBlock start=/\$\$/ end=/\$\$/ keepend contains=@LATEX
syn region doconceLaTeXMathBlock start=/\\\@<!\\\[/ end=/\\\@<!\\\]/ keepend contains=@LATEX
syn match doconceLaTeXCommand /\\[[:alpha:]]\+\(\({.\{-}}\)\=\(\[.\{-}\]\)\=\)*/ contains=@LATEX
syn region doconceLaTeXRegion start=/\\begin{\z(.\{-}\)}/ end=/\\end{\z1}/ keepend contains=@LATEX
" we rehighlight sectioning commands, because otherwise tex.vim captures all text until EOF or a new sectioning command
syn region doconceLaTeXSection start=/\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)\*\=\(\[.*\]\)\={/ end=/\}/ keepend
syn match doconceLaTeXSectionCmd /\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)/ contained containedin=doconceLaTexSection
syn match doconceLaTeXDelimiter /[[\]{}]/ contained containedin=doconceLaTeXSection
" }}}3

syn match doconceSpecial /<linebreak>/
syn match doconceSpecial /\[\^.*\]:\?/
syn match doconceSpecial /^----\+/

hi def link doconceSpecial            Type
hi def link doconceQuizKeyword        Number
hi def link doconceContainer          Type
hi def link doconceHeading            Statement
hi def link doconceHeadingText        PreProc 
hi def link doconceTodos              TODO
hi def link doconceComment            Comment
hi def link doconceAbstract           String
hi def link doconcePreambleKey        Statement
hi def link doconcePreambleVal        PreProc
hi def link doconceList               Statement
hi def link doconceFigureKey          Number
hi def link doconceFigureVal          String
hi def link doconceEmphasis           String
hi def link doconceQuote              String
