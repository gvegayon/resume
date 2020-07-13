all:
	pdflatex cv_george_en.tex && evince cv_george_en.pdf &
docx:
	pandoc --bibliography=papers.bib -f latex -t docx resume.tex -o resume.docx

.PHONY: docx all

