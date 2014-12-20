library("knitr")

#knit("1-Triazolylethylethe.Rmd")
#markdownToHTML('1-Triazolylethylethe.md', '1-Triazolylethylethe.html', options=c("use_xhml"))
#system("pandoc -s 1-Triazolylethylethe.html -o 1-Triazolylethylethe.pdf")


knitr::knit2html('1-Triazolylethylethe.Rmd', "html_document")
