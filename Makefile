SRC=preamble.txt tasks.txt vars.txt regions.txt ui.txt aobjects.txt threads.txt channels.txt semaphores.txt syncvars.txt serialize.txt zmq.txt zgap.txt lowlevel.txt
MPI_SRC=mpi-overview.txt mpi-handles.txt mpi-lowlevel.txt
DENOTE=bin/denote

all: html

html_hpcdoc.html: $(SRC) $(MPI_SRC)
	$(DENOTE) -html $(SRC) > hpcdoc.html
	$(DENOTE) -html $(MPI_SRC) > mpigapdoc.html  
gapdoc: $(SRC) $(MPI_SRC)
	$(DENOTE) -gapdoc $(SRC) > hpcdoc.xml
	$(DENOTE) -gapdoc $(MPI_SRC) > mpigapdoc.xml  
wiki:	$(SRC) $(MPI_SRC)
	$(DENOTE) -wiki $(SRC) > hpcdoc.wiki
	$(DENOTE) -wiki $(MPI_SRC) > mpigapdoc.wiki
cat:	$(SRC)
	cat $(SRC) >all.txt

pdf: hpcdoc.html template.latex
	pandoc -o hpcdoc.pdf --template=template.latex -V papersize:a4paper -V geometry:margin=1in -V fontsize:10pt hpcdoc.html
