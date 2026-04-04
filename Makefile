all: bib
	typst compile cv.typ cv.pdf

bib:
	python3 bib2typst.py papers.bib --keyword published -o bib-published.typ
	python3 bib2typst.py papers.bib --keyword wip -o bib-wip.typ
	python3 bib2typst.py presentations-conference.bib --keyword conferencetalk -o bib-conferencetalk.typ
	python3 bib2typst.py presentations-invited.bib --keyword invitedtalk -o bib-invitedtalk.typ
	python3 bib2typst.py presentations-other.bib --keyword othertalk -o bib-othertalk.typ

update:
	rsync -av ../talks/talks/*.bib .

software: software.R
	R CMD BATCH --vanilla software.R software.Rout

.PHONY: all bib

combine:
	pdftk resume.pdf cv.pdf cat output cv-resume.pdf