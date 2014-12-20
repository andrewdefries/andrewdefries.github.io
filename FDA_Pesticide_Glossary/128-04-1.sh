library("knitr")

#knit("128-04-1.Rmd")
#markdownToHTML('128-04-1.md', '128-04-1.html', options=c("use_xhml"))
#system("pandoc -s 128-04-1.html -o 128-04-1.pdf")


knitr::knit2html('128-04-1.Rmd', "html_document")
