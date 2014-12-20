library("knitr")

#knit("112839-33-5.Rmd")
#markdownToHTML('112839-33-5.md', '112839-33-5.html', options=c("use_xhml"))
#system("pandoc -s 112839-33-5.html -o 112839-33-5.pdf")


knitr::knit2html('112839-33-5.Rmd', "html_document")
