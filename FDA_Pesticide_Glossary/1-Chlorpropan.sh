library("knitr")

#knit("1-Chlorpropan.Rmd")
#markdownToHTML('1-Chlorpropan.md', '1-Chlorpropan.html', options=c("use_xhml"))
#system("pandoc -s 1-Chlorpropan.html -o 1-Chlorpropan.pdf")


knitr::knit2html('1-Chlorpropan.Rmd', "html_document")
