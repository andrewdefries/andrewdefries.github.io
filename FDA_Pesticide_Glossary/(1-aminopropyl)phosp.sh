library("knitr")

#knit("(1-aminopropyl)phosp.Rmd")
#markdownToHTML('(1-aminopropyl)phosp.md', '(1-aminopropyl)phosp.html', options=c("use_xhml"))
#system("pandoc -s (1-aminopropyl)phosp.html -o (1-aminopropyl)phosp.pdf")


knitr::knit2html('(1-aminopropyl)phosp.Rmd', "html_document")
