SRC=preamble.txt tasks.txt vars.txt regions.txt threads.txt channels.txt syncvars.txt lowlevel.txt
DENOTE=bin/denote

all: html

html: $(SRC)
	$(DENOTE) -html $(SRC) > hpcdoc.html
gapdoc: $(SRC)
	$(DENOTE) -gapdoc $(SRC) > hpcdoc.xml
wiki:	$(SRC)
	$(DENOTE) -wiki $(SRC) > hpcdoc.wiki
cat:	$(SRC)
	cat $(SRC) >all.txt
