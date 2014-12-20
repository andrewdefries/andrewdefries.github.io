library("knitr")

#knit("2-(1,1,2,2-Tetrachlo.Rmd")
#markdownToHTML('2-(1,1,2,2-Tetrachlo.md', '2-(1,1,2,2-Tetrachlo.html', options=c("use_xhml"))
#system("pandoc -s 2-(1,1,2,2-Tetrachlo.html -o 2-(1,1,2,2-Tetrachlo.pdf")


knitr::knit2html('2-(1,1,2,2-Tetrachlo.Rmd', "html_document")
