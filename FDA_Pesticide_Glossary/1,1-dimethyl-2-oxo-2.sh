library("knitr")

#knit("1,1-dimethyl-2-oxo-2.Rmd")
#markdownToHTML('1,1-dimethyl-2-oxo-2.md', '1,1-dimethyl-2-oxo-2.html', options=c("use_xhml"))
#system("pandoc -s 1,1-dimethyl-2-oxo-2.html -o 1,1-dimethyl-2-oxo-2.pdf")


knitr::knit2html('1,1-dimethyl-2-oxo-2.Rmd', "html_document")
