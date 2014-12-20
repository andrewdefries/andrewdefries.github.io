library("knitr")

#knit("16709-30-1.Rmd")
#markdownToHTML('16709-30-1.md', '16709-30-1.html', options=c("use_xhml"))
#system("pandoc -s 16709-30-1.html -o 16709-30-1.pdf")


knitr::knit2html('16709-30-1.Rmd', "html_document")
