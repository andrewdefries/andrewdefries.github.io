library("knitr")

#knit("1H-1,2,4-Triazole-1-.Rmd")
#markdownToHTML('1H-1,2,4-Triazole-1-.md', '1H-1,2,4-Triazole-1-.html', options=c("use_xhml"))
#system("pandoc -s 1H-1,2,4-Triazole-1-.html -o 1H-1,2,4-Triazole-1-.pdf")


knitr::knit2html('1H-1,2,4-Triazole-1-.Rmd', "html_document")
