# The University of Alabama Thesis Template

This is a LaTeX template for students writing a thesis at The University of
Alabama. This is the class file I created and ended up using for my MS work.
It is a reverse-engineering of the style guidelines posted by the graduate
school and a few other theses I've seen. I worked primarily from [this
sample][guidelines].

[guidelines]: http://services.graduate.ua.edu/etd/td_sample.pdf

## Document Preamble

The first step is to include the document class. `uathesis` is based on the
`report` document class if in case you are familiar with working in it.

    \documentclass[thesis]{uathesis}

OR

    \documentclass[dissertation]{uathesis}

You may then include any `\usepackage` statements you might need specifically
for your document. There are some introduced fields which are new to
`uathesis`.

* `\author{<name>}` sets the author as you see in other document classes
* `\adviser{<name>}` sets your adviser/committee chair's name
* `\committee{<names>}` specifies your committe (use `\and` to separate names)
* `\title{<title>}` is the title of your thesis
  (you must form the inverted pyramid manually using `\and`)
* `\degree{<name>}` is the name of the degree you're seeking
* `\department{<name>}` is the subject name of the relevant department
  (e.g., Computer Science)
* `\abstract{<text>}` are the abstract paragraphs of your thesis
* `\dedication{<text>}` is the dedication section of your thesis
* `\acknowledgments{<text>}` is the acknowledgements of your thesis

There are a few optional commands as well:

* `\university{<name>}` will change the University name in case you are not at
  The University of Alabama
* `\school{<name>}` will change the school in case you're not at the Graduate
  School
* `\gradyear{<year>}` changes the graduation year in case it's not this year
* `\place{<city, state>}` changes the place in case it's not Tuscaloosa,
  Alabama

## Front Matter

The most attractive feature of the document class is the automatic generation
of the front matter. If you have completed the preamble, then you can generate
the front matter like so:

    \begin{document}
    \makefrontmatter

## Body Chapters

When you area ready to start writing your body chapters, you must first open up
the `body` environment:

    \begin{body}

Chapter names needs to be specified in all caps. This is because the table of
contents currently does not do this for you automatically because I couldn't
figure it out.

    \chapter{MY CHAPTER NAME IN ALL CAPS}

## List of Abbreviations and Symbols

The template also asks that you include a glossary of abbreviations and
symbols. The document class handles this for you via the use of the
`glossaries` LaTeX package. You may find the documentation for it here:

http://tug.ctan.org/tex-archive/macros/latex/contrib/glossaries/

The user guide may be found here:

http://mirrors.ctan.org/macros/latex/contrib/glossaries/glossaries-user.pdf

Some example usage may also be found in the included example.

## Tables and Figures

Tables and Figures automatically get listed in a "List of Tables" or "List of
Figures" section. If you've done academic writing before, tables and figures
are used the way they are normally. If not, here are some examples:

    \begin{figure}
      \centering
      \includegraphics[width=5.0in]{fig/shapes.pdf}
      \caption{Some shapes which I find very interesting.}
      \label{fig:shapes}
    \end{figure}

The above example includes the file `fig/shapes.pdf` into your document. If you
don't know, you really should use PDFs as your figures if you're using
`pdflatex`.

    \begin{table}
      \centering
      \input{tab/love-shapes.tex}
      \caption{Shapes and corresponding love in Love Standard Units (LSU).}
      \label{tab:love-shapes}
    \end{table}

The above includes a table (with the `tabular` environment defined in
`tab/love-shapes.tex`) into your document.

You should keep your captions short as they end up becoming the names in the
List of Figures/Tables. You don't want to bloat that section.

## The Bibliography

I assume you're using BibTeX (you probably should).

I used the `plain` bibliography style. The guidelines state that the table of
contents must include the bibliography and I'm still having trouble with that,
so this is done manually for now.

    \addcontentsline{toc}{chapter}{REFERENCES}
    \bibliographystyle{plain}
    \bibliography{thesis-template}

## Appendix

To start the appendix:

    \appendix

Finally, continue adding chapters as normal.

## Workflow

A big part of this is staying organized so I'm going to include my workflow as
well.

Here are the things you need:

* An editing system (though I just used vim, :set spell, and aspell)
* Source control (git)
* Diagram editor (Dia is nice and free -- Inkscape as well)

First of all, here's what my directory structure looked like.

* `/thesis.tex` -- the main document
* `/thesis.bib` -- the bibliography database
* `/dia/` -- all of my 'original' diagram files (.dia files)
* `/svg/` -- all of my 'original' svg files (.svg files)
* `/tab/` -- all of my `tabular`'s (.tex files)
* `/fig/` -- all of my generated PDFs (and other temporary files)

I ended up writing scripts that would generate PDFs from my Dia files. You can
do the same with Inkscape. The scripts would generate PDFs in `/fig/` from the
diagrams in `/dia/`. `/fig/` would not contain anything I wouldn't mind losing
immediately, unless it was some sort of raster file (.png or .jpg) that I was
forced to use.
