library("knitr")

#knit("2-(1,3-Dioxolan-2-yl.Rmd")
#markdownToHTML('2-(1,3-Dioxolan-2-yl.md', '2-(1,3-Dioxolan-2-yl.html', options=c("use_xhml"))
#system("pandoc -s 2-(1,3-Dioxolan-2-yl.html -o 2-(1,3-Dioxolan-2-yl.pdf")


knitr::knit2html('2-(1,3-Dioxolan-2-yl.Rmd', "html_document")
