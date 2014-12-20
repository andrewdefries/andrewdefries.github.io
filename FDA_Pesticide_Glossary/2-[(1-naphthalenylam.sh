library("knitr")

#knit("2-[(1-naphthalenylam.Rmd")
#markdownToHTML('2-[(1-naphthalenylam.md', '2-[(1-naphthalenylam.html', options=c("use_xhml"))
#system("pandoc -s 2-[(1-naphthalenylam.html -o 2-[(1-naphthalenylam.pdf")


knitr::knit2html('2-[(1-naphthalenylam.Rmd', "html_document")
