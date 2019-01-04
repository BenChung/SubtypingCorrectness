all: figures fast

fast:
	pdflatex main

slow:
	pdflatex main
	biblatex main
	pdflatex main
	pdflatex main

figures:figures/example.dot figures/left1.dot figures/right1.dot figures/left2.dot figures/right2.dot
	dot figures/example.dot -Tpdf -ofigures-gen/example.pdf
	dot figures/left1.dot -Tpdf -ofigures-gen/left1.pdf
	dot figures/right1.dot -Tpdf -ofigures-gen/right1.pdf
	dot figures/left2.dot -Tpdf -ofigures-gen/left2.pdf
	dot figures/right2.dot -Tpdf -ofigures-gen/right2.pdf
