library("knitr")

#knit("1H-benzimidazol-2-yl.Rmd")
#markdownToHTML('1H-benzimidazol-2-yl.md', '1H-benzimidazol-2-yl.html', options=c("use_xhml"))
#system("pandoc -s 1H-benzimidazol-2-yl.html -o 1H-benzimidazol-2-yl.pdf")


knitr::knit2html('1H-benzimidazol-2-yl.Rmd', "html_document")
