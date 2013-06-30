INPUT = music.xml
STYLESHEETS = $(wildcard *.xsl)
DOCUMENTS = $(STYLESHEETS:.xsl=.htm)

all: $(DOCUMENTS)

%.htm: %.xsl $(INPUT)
	xsltproc -o "$@" "$<" "$(INPUT)"

.PHONY: all
