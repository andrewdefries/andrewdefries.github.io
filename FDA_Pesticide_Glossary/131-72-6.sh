library("knitr")

#knit("131-72-6.Rmd")
#markdownToHTML('131-72-6.md', '131-72-6.html', options=c("use_xhml"))
#system("pandoc -s 131-72-6.html -o 131-72-6.pdf")


knitr::knit2html('131-72-6.Rmd', "html_document")
