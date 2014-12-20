library("knitr")

#knit("2-(1,2,4-triazol-1-y.Rmd")
#markdownToHTML('2-(1,2,4-triazol-1-y.md', '2-(1,2,4-triazol-1-y.html', options=c("use_xhml"))
#system("pandoc -s 2-(1,2,4-triazol-1-y.html -o 2-(1,2,4-triazol-1-y.pdf")


knitr::knit2html('2-(1,2,4-triazol-1-y.Rmd', "html_document")
