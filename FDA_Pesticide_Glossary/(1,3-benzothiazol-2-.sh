library("knitr")

#knit("(1,3-benzothiazol-2-.Rmd")
#markdownToHTML('(1,3-benzothiazol-2-.md', '(1,3-benzothiazol-2-.html', options=c("use_xhml"))
#system("pandoc -s (1,3-benzothiazol-2-.html -o (1,3-benzothiazol-2-.pdf")


knitr::knit2html('(1,3-benzothiazol-2-.Rmd', "html_document")
