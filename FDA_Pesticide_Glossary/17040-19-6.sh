library("knitr")

#knit("17040-19-6.Rmd")
#markdownToHTML('17040-19-6.md', '17040-19-6.html', options=c("use_xhml"))
#system("pandoc -s 17040-19-6.html -o 17040-19-6.pdf")


knitr::knit2html('17040-19-6.Rmd', "html_document")
