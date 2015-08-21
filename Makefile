BUILD = build
DOC = thesis-template.tex
PDF = $(BUILD)/$(DOC:.tex=.pdf)

TEXFLAGS ?=
BIBFLAGS ?=
GLSFLAGS ?=

all: $(PDF)

clean:
	rm -rf $(BUILD)

$(PDF): $(DOC)
	mkdir -p $(BUILD)
	pdflatex -output-directory=$(BUILD) $(TEXFLAGS) $(DOC)
	cd $(BUILD); makeglossaries $(GLSFLAGS) $(DOC:.tex=)
	bibtex $(BIBFLAGS) $(BUILD)/$(DOC:.tex=)
	pdflatex -output-directory=$(BUILD) $(TEXFLAGS) $(DOC)
	pdflatex -output-directory=$(BUILD) $(TEXFLAGS) $(DOC)
