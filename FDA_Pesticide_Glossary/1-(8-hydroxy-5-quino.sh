library("knitr")

#knit("1-(8-hydroxy-5-quino.Rmd")
#markdownToHTML('1-(8-hydroxy-5-quino.md', '1-(8-hydroxy-5-quino.html', options=c("use_xhml"))
#system("pandoc -s 1-(8-hydroxy-5-quino.html -o 1-(8-hydroxy-5-quino.pdf")


knitr::knit2html('1-(8-hydroxy-5-quino.Rmd', "html_document")