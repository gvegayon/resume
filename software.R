library(bibtex)

# Getting the badges
pkgs <- c(
  "netdiffuseR",
  "rgexf",
  "ABCoptim",
  "ergmito",
  "fmcmc",
  "slurmR",
  "googlePublicData",
  "aphylo",
  "netplot",
  "epiworldR",
  "defm"
  )

for (pkg in pkgs) {
  pkg_svg <- sprintf("fig/cran-downloads-%s.svg", tolower(pkg))
  pkg_pdf <- sprintf("fig/cran-downloads-%s.pdf", tolower(pkg))
  
  download.file(
    url = sprintf("http://cranlogs.r-pkg.org/badges/grand-total/%s", pkg),
    destfile = pkg_svg
  )
  
  rsvg::rsvg_pdf(pkg_svg, pkg_pdf)
  # system(
  #   sprintf(
  #     "inkscape %s --export-area-drawing --batch-process --export-type=pdf --export-filename=%s",
  #     pkg_svg,
  #     pkg_pdf
  #     )
  #   )
}
  

unpublished <- c("pruner", "barry", "twitterreport", "epiworld", "defm")

bib <- read.bib("software.bib")

bib <- unclass(bib)

bib <- lapply(bib, function(b) {
  b$author <- paste(gsub(
    "George( G.)? Vega( Yon)?|Vega( Yon)?, George( G.)?",
    "\\\\textbf{George G.} \\\\textbf{Vega Yon}",
    b$author
    ), collapse = ", ")
  b
})
bib <- bib[order(as.integer(sapply(bib, "[[", "year")), decreasing = TRUE)]
tmp <- "software.tex"
file.remove(tmp)
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
