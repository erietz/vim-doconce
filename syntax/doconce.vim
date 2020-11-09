" Vim syntax file
" Language:     Doconce
" Maintainer:   Ethan Rietz
" Filenames:    *.do *.do.txt


" Match TODO comments
syntax keyword doconceTodos TODO XXX FIXME NOTE

syn match doconceComment "^#.*$"

syn match doconcePreamble /^TITLE:\|^AUTHOR:\|^DATE:/
syn match doconceList "^* \|^o "
syn match doconceFigure "^FIGURE: \[.*\]"

syn match doconceEmphasis /_.\+_/
syn match doconceEmphasis /\*.\+\*/
syn match doconceEmphasis /`.\+`/
syn match doconceEmphasis /``.\+''/

syn match doconceQuizKeyword "^Q:\|^Cw:\|^Cr:\|^E:\|^K:\|^L:\|^H:\|^NP:" contained
syn region doconceQuizDelim matchgroup=doconceContainer start=/^!bquiz/ end=/^!equiz/ fold transparent contains=ALLBUT,doconcePreamble

syn region doconceCodeDelim matchgroup=doconceContainer start=/^!bc/ end=/^!ec/ fold transparent contains=ALLBUT,doconcePreamble,doconceQuizKeyword
syn region doconceTexDelim matchgroup=doconceContainer start=/^!bt/ end=/^!et/ fold transparent contains=ALLBUT,doconcePreamble,doconceQuizKeyword

syn region doconceHeadingText matchgroup=doconceHeading start=/^======= / end=/ =======$/ contains=ALLBUT,doconcePreamble
syn region doconceHeadingText matchgroup=doconceHeading start=/^===== / end=/ =====$/ contains=ALLBUT,doconcePreamble
syn region doconceHeadingText matchgroup=doconceHeading start=/^=== / end=/ ===$/ contains=ALLBUT,doconcePreamble


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
syn region doconceLaTexSection start=/\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)\*\=\(\[.*\]\)\={/ end=/\}/ keepend
syn match doconceLaTexSectionCmd /\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)/ contained containedin=doconceLaTexSection
syn match doconceLaTeXDelimiter /[[\]{}]/ contained containedin=doconceLaTexSection
" }}}3


hi def link doconceQuizKeyword        Identifier
hi def link doconceContainer          Function
hi def link doconceHeading            Type
hi def link doconceHeadingText        String 
hi def link doconceTodos              TODO
hi def link doconceComment            Comment
hi def link doconceKeywords           Keyword
hi def link doconcePreamble           Type
hi def link doconceList               Statement
hi def link doconceFigure             Identifier
hi def link doconceEmphasis           Number
