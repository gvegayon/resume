# sudo docker run --rm --net=host --env="DISPLAY" -v$(pwd):/app -w/app minidocks/inkscape:latest fig/cran-downloads-abcoptim.svg --export-area-drawing -o abcoptim.pdf

all:
	pdflatex --enable-write18 cv.tex && evince cv.pdf &
docx:
	pandoc --bibliography=papers.bib,software.bib -f latex -t docx resume.tex -o resume.docx

cvdocx:
	pandoc --bibliography=papers.bib,software.bib -f latex -t docx cv.tex -o cv.docx

update:
	rsync -av ../talks/talks/*.bib .

software: software.R
	R CMD BATCH --vanilla software.R software.Rout

.PHONY: docx all

combine:
	pdftk resume.pdf cv.pdf cat output cv-resume.pdf