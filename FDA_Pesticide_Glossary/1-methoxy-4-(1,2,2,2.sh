library("knitr")

#knit("1-methoxy-4-(1,2,2,2.Rmd")
#markdownToHTML('1-methoxy-4-(1,2,2,2.md', '1-methoxy-4-(1,2,2,2.html', options=c("use_xhml"))
#system("pandoc -s 1-methoxy-4-(1,2,2,2.html -o 1-methoxy-4-(1,2,2,2.pdf")


knitr::knit2html('1-methoxy-4-(1,2,2,2.Rmd', "html_document")
