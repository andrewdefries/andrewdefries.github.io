library("knitr")

#knit("1,2,3-trithian-5-yl_.Rmd")
#markdownToHTML('1,2,3-trithian-5-yl_.md', '1,2,3-trithian-5-yl_.html', options=c("use_xhml"))
#system("pandoc -s 1,2,3-trithian-5-yl_.html -o 1,2,3-trithian-5-yl_.pdf")


knitr::knit2html('1,2,3-trithian-5-yl_.Rmd', "html_document")
