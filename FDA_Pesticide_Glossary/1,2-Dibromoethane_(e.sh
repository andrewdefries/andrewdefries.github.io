library("knitr")

#knit("1,2-Dibromoethane_(e.Rmd")
#markdownToHTML('1,2-Dibromoethane_(e.md', '1,2-Dibromoethane_(e.html', options=c("use_xhml"))
#system("pandoc -s 1,2-Dibromoethane_(e.html -o 1,2-Dibromoethane_(e.pdf")


knitr::knit2html('1,2-Dibromoethane_(e.Rmd', "html_document")
