library("knitr")

#knit("1,2,4-triazole.Rmd")
#markdownToHTML('1,2,4-triazole.md', '1,2,4-triazole.html', options=c("use_xhml"))
#system("pandoc -s 1,2,4-triazole.html -o 1,2,4-triazole.pdf")


knitr::knit2html('1,2,4-triazole.Rmd', "html_document")
