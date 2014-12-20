library("knitr")

#knit("1-{[bis-(4-fluorophe.Rmd")
#markdownToHTML('1-{[bis-(4-fluorophe.md', '1-{[bis-(4-fluorophe.html', options=c("use_xhml"))
#system("pandoc -s 1-{[bis-(4-fluorophe.html -o 1-{[bis-(4-fluorophe.pdf")


knitr::knit2html('1-{[bis-(4-fluorophe.Rmd', "html_document")
