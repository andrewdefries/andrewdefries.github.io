library("knitr")

#knit("10004-44-1.Rmd")
#markdownToHTML('10004-44-1.md', '10004-44-1.html', options=c("use_xhml"))
#system("pandoc -s 10004-44-1.html -o 10004-44-1.pdf")


knitr::knit2html('10004-44-1.Rmd', "html_document")
