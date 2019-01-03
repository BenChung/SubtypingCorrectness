all: fast

fast:
	pdflatex main

slow:
	pdflatex main
	biblatex main
	pdflatex main
	pdflatex main
