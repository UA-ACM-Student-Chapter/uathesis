#!/bin/bash

## Dead-simple script to build example thesis.
## 'makeglossaries' is a perl script which comes with whatever package
## provides you with glossaries.sty in your LaTeX distribution.

pdflatex thesis-template.tex && \
  makeglossaries thesis-template && \
  pdflatex thesis-template.tex && \
  bibtex thesis-template && \
  pdflatex thesis-template.tex && \
  pdflatex thesis-template.tex
