# sudo docker run --rm --net=host --env="DISPLAY" -v$(pwd):/app -w/app minidocks/inkscape:latest fig/cran-downloads-abcoptim.svg --export-area-drawing -o abcoptim.pdf

all:
	pdflatex cv.tex && evince cv.pdf &
docx:
	pandoc --bibliography=papers.bib -f latex -t docx resume.tex -o resume.docx

update:
	rsync -av ../../talks/talks-all/*.bib .

.PHONY: docx all

