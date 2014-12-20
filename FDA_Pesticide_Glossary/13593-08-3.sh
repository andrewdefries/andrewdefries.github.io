library("knitr")

#knit("13593-08-3.Rmd")
#markdownToHTML('13593-08-3.md', '13593-08-3.html', options=c("use_xhml"))
#system("pandoc -s 13593-08-3.html -o 13593-08-3.pdf")


knitr::knit2html('13593-08-3.Rmd', "html_document")
