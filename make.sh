#!/bin/bash

## Dead-simple script to build example thesis.
## 'makeglossaries' is a perl script which comes with whatever package
## provides you with glossaries.sty in your LaTeX distribution.

rm -f *.aux *.bbl *.blg *.glg *.glo *.gls *.lof *.log *.lot *.out *.toc *.xdy

pdflatex thesis-template.tex && \
  makeglossaries thesis-template && \
  pdflatex thesis-template.tex && \
  bibtex thesis-template && \
  pdflatex thesis-template.tex && \
  pdflatex thesis-template.tex
