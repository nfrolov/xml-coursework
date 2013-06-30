INPUT = music.xml
STYLESHEETS = $(wildcard *.xsl)
DOCUMENTS = $(STYLESHEETS:.xsl=.htm)

all: $(DOCUMENTS)

%.htm: %.xsl
	xsltproc -o "$@" "$<" "$(INPUT)"

.PHONY: all
