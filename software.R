library(bibtex)

unpublished <- c("pruner", "barry", "aphylo", "netplot", "twitterreport")

bib <- read.bib("software.bib")

bib <- unclass(bib)

bib <- lapply(bib, function(b) {
  b$author <- paste(gsub(
    "George( G.)? Vega( Yon)?|Vega( Yon)?, George( G.)?",
    "{\\\\bfseries George G.} {\\\\bfseries Vega Yon}",
    b$author
    ), collapse = ", ")
  b
})
bib <- bib[order(as.integer(sapply(bib, "[[", "year")), decreasing = TRUE)]
tmp <- tempfile()
for (n in names(bib)) {
  
  # Figuiring out badge
  if (file.exists(badge <- sprintf("fig/cran-downloads-%s.pdf", tolower(n))))
    badge <- sprintf("\\\\\\includegraphics[width=2.5cm]{%s}", badge)
  else
    badge <- ""
  
  cat(
    sprintf(
      "\\item %s. \\textit{%s} (%s). %s. {\\small URL}: \\url{%s}. %s",
      bib[[n]]$author, bib[[n]]$title, bib[[n]]$year,
      bib[[n]]$note, bib[[n]]$url, badge),
    "\n",
    file = tmp,
    append = TRUE
    )
}

file.rename(tmp, "software.tex")
