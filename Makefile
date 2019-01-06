all: figures fast

fast:
	pdflatex main

slow:
	pdflatex main
	biblatex main
	pdflatex main
	pdflatex main

figures:figures/example1.dot figures/left1.dot figures/right1.dot figures/left2.dot figures/right2.dot \
		figures/example2.dot figures/example3.dot
	dot figures/example1.dot -Tpdf -ofigures-gen/example1.pdf
	dot figures/example2.dot -Tpdf -ofigures-gen/example2.pdf
	dot figures/example3.dot -Tpdf -ofigures-gen/example3.pdf
	dot figures/left1.dot -Tpdf -ofigures-gen/left1.pdf
	dot figures/right1.dot -Tpdf -ofigures-gen/right1.pdf
	dot figures/left2.dot -Tpdf -ofigures-gen/left2.pdf
	dot figures/right2.dot -Tpdf -ofigures-gen/right2.pdf
