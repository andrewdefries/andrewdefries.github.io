library("knitr")

#knit("1,2-Dibromethan.Rmd")
#markdownToHTML('1,2-Dibromethan.md', '1,2-Dibromethan.html', options=c("use_xhml"))
#system("pandoc -s 1,2-Dibromethan.html -o 1,2-Dibromethan.pdf")


knitr::knit2html('1,2-Dibromethan.Rmd', "html_document")
