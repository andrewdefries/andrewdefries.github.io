library("knitr")

#knit("116-06-3.Rmd")
#markdownToHTML('116-06-3.md', '116-06-3.html', options=c("use_xhml"))
#system("pandoc -s 116-06-3.html -o 116-06-3.pdf")


knitr::knit2html('116-06-3.Rmd', "html_document")
