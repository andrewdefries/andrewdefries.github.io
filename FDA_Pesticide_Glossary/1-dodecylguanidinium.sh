library("knitr")

#knit("1-dodecylguanidinium.Rmd")
#markdownToHTML('1-dodecylguanidinium.md', '1-dodecylguanidinium.html', options=c("use_xhml"))
#system("pandoc -s 1-dodecylguanidinium.html -o 1-dodecylguanidinium.pdf")


knitr::knit2html('1-dodecylguanidinium.Rmd', "html_document")
