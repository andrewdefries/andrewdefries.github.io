library("knitr")

#knit("(1,3-dihydro-1,3-dio.Rmd")
#markdownToHTML('(1,3-dihydro-1,3-dio.md', '(1,3-dihydro-1,3-dio.html', options=c("use_xhml"))
#system("pandoc -s (1,3-dihydro-1,3-dio.html -o (1,3-dihydro-1,3-dio.pdf")


knitr::knit2html('(1,3-dihydro-1,3-dio.Rmd', "html_document")
