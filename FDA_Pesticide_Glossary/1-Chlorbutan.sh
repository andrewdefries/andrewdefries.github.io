library("knitr")

#knit("1-Chlorbutan.Rmd")
#markdownToHTML('1-Chlorbutan.md', '1-Chlorbutan.html', options=c("use_xhml"))
#system("pandoc -s 1-Chlorbutan.html -o 1-Chlorbutan.pdf")


knitr::knit2html('1-Chlorbutan.Rmd', "html_document")
