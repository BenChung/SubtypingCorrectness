all: figures fast

fast:
	pdflatex main

jan:
	pdflatex main
	bibtex main
	open main.pdf

slow:
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

figures:figures/example1.dot figures/left1.dot figures/right1.dot figures/left2.dot figures/right2.dot \
		figures/example2.dot figures/example3.dot figures/transex1.dot figures/transex2.dot figures/transex3.dot figures/exmp1.dot \
		figures/exmp2a.dot figures/exmp2b.dot figures/exmp2c.dot figures/exmp2d.dot 
	dot figures/example1.dot -Tpdf -ofigures-gen/example1.pdf
	dot figures/example2.dot -Tpdf -ofigures-gen/example2.pdf
	dot figures/example3.dot -Tpdf -ofigures-gen/example3.pdf
	dot figures/left1.dot -Tpdf -ofigures-gen/left1.pdf
	dot figures/right1.dot -Tpdf -ofigures-gen/right1.pdf
	dot figures/left2.dot -Tpdf -ofigures-gen/left2.pdf
	dot figures/right2.dot -Tpdf -ofigures-gen/right2.pdf
	dot figures/transex1.dot -Tpdf -ofigures-gen/transex1.pdf
	dot figures/transex2.dot -Tpdf -ofigures-gen/transex2.pdf
	dot figures/transex3.dot -Tpdf -ofigures-gen/transex3.pdf
	dot figures/exmp1.dot -Tpdf -ofigures-gen/exmp1.pdf
	dot figures/exmp2a.dot -Tpdf -ofigures-gen/exmp2a.pdf
	dot figures/exmp2b.dot -Tpdf -ofigures-gen/exmp2b.pdf
	dot figures/exmp2c.dot -Tpdf -ofigures-gen/exmp2c.pdf
	dot figures/exmp2d.dot -Tpdf -ofigures-gen/exmp2d.pdf
