library("knitr")

#knit("2-[1-(Ethoxyimino)bu.Rmd")
#markdownToHTML('2-[1-(Ethoxyimino)bu.md', '2-[1-(Ethoxyimino)bu.html', options=c("use_xhml"))
#system("pandoc -s 2-[1-(Ethoxyimino)bu.html -o 2-[1-(Ethoxyimino)bu.pdf")


knitr::knit2html('2-[1-(Ethoxyimino)bu.Rmd', "html_document")
