library("knitr")

#knit("1-(2-cyano-2-methoxy.Rmd")
#markdownToHTML('1-(2-cyano-2-methoxy.md', '1-(2-cyano-2-methoxy.html', options=c("use_xhml"))
#system("pandoc -s 1-(2-cyano-2-methoxy.html -o 1-(2-cyano-2-methoxy.pdf")


knitr::knit2html('1-(2-cyano-2-methoxy.Rmd', "html_document")
