library("knitr")

#knit("2-[1-(ethoxyimino)pr.Rmd")
#markdownToHTML('2-[1-(ethoxyimino)pr.md', '2-[1-(ethoxyimino)pr.html', options=c("use_xhml"))
#system("pandoc -s 2-[1-(ethoxyimino)pr.html -o 2-[1-(ethoxyimino)pr.pdf")


knitr::knit2html('2-[1-(ethoxyimino)pr.Rmd', "html_document")
