library("knitr")

#knit("1-chlorobut-1-ene.Rmd")
#markdownToHTML('1-chlorobut-1-ene.md', '1-chlorobut-1-ene.html', options=c("use_xhml"))
#system("pandoc -s 1-chlorobut-1-ene.html -o 1-chlorobut-1-ene.pdf")


knitr::knit2html('1-chlorobut-1-ene.Rmd', "html_document")
