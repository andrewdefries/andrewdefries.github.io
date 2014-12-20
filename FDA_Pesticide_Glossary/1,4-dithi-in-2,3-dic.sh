library("knitr")

#knit("1,4-dithi-in-2,3-dic.Rmd")
#markdownToHTML('1,4-dithi-in-2,3-dic.md', '1,4-dithi-in-2,3-dic.html', options=c("use_xhml"))
#system("pandoc -s 1,4-dithi-in-2,3-dic.html -o 1,4-dithi-in-2,3-dic.pdf")


knitr::knit2html('1,4-dithi-in-2,3-dic.Rmd', "html_document")
