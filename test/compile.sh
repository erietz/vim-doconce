#!/bin/sh

doconce format pdflatex test.do  --latex_code_style=pyg

latexmk -pdf -shell-escape *.tex

latexmk -c
