library("knitr")

#knit("2-(1-(3-chloroallylo.Rmd")
#markdownToHTML('2-(1-(3-chloroallylo.md', '2-(1-(3-chloroallylo.html', options=c("use_xhml"))
#system("pandoc -s 2-(1-(3-chloroallylo.html -o 2-(1-(3-chloroallylo.pdf")


knitr::knit2html('2-(1-(3-chloroallylo.Rmd', "html_document")
