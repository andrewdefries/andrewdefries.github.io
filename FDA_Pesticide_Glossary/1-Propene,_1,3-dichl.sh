library("knitr")

#knit("1-Propene,_1,3-dichl.Rmd")
#markdownToHTML('1-Propene,_1,3-dichl.md', '1-Propene,_1,3-dichl.html', options=c("use_xhml"))
#system("pandoc -s 1-Propene,_1,3-dichl.html -o 1-Propene,_1,3-dichl.pdf")


knitr::knit2html('1-Propene,_1,3-dichl.Rmd', "html_document")
