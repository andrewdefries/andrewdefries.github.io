library("knitr")

#knit("1-naphthol.Rmd")
#markdownToHTML('1-naphthol.md', '1-naphthol.html', options=c("use_xhml"))
#system("pandoc -s 1-naphthol.html -o 1-naphthol.pdf")


knitr::knit2html('1-naphthol.Rmd', "html_document")
