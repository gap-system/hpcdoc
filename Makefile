SRC=preamble.txt tasks.txt vars.txt regions.txt threads.txt channels.txt syncvars.txt lowlevel.txt

all: html gapdoc wiki

html: $(SRC)
	denote -html $(SRC) > hpcdoc.html
gapdoc: $(SRC)
	denote -gapdoc $(SRC) > hpcdoc.xml
wiki:	$(SRC)
	denote -wiki $(SRC) > hpcdoc.wiki
