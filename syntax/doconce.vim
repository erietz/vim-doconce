" Vim syntax file
" Language:     Doconce
" Maintainer:   Ethan Rietz
" Filenames:    *.do *.do.txt

"
" Match TODO comments
syntax keyword doconceTodos TODO XXX FIXME NOTE

syn match doconceComment "^#.*$"

syn match doconceKeywords "^!bc\|^!ec"
syn match doconceKeywords "^!bt\|^!et"
syn match doconceKeywords "^!bquiz\|^!equiz"
syn match doconceQuiz "^Q:\|^Cw:\|^Cr:\|^E:\|^K:\|^L:\|^H:\|^NP:"
syn match doconcePreamble "^TITLE:\|^AUTHOR:\|^DATE:\|^FIGURE:\|MOVIE:"
syn match doconceList "^* \|^o "
syn match doconceFigure "^FIGURE: \[.*\]"

syn match doconceHeading "^======= .* ======="
syn match doconceHeading "^===== .* ====="
syn match doconceHeading "^=== .* ==="

hi def link doconceHeading       String
hi def link doconceTodos         TODO
hi def link doconceComment       Comment
hi def link doconceKeywords      Keyword
hi def link doconcePreamble      Special
hi def link doconceQuiz          Type
hi def link doconceList          Identifier
hi def link doconceFigure        Function


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
