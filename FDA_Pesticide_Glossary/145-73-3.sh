library("knitr")

#knit("145-73-3.Rmd")
#markdownToHTML('145-73-3.md', '145-73-3.html', options=c("use_xhml"))
#system("pandoc -s 145-73-3.html -o 145-73-3.pdf")


knitr::knit2html('145-73-3.Rmd', "html_document")
