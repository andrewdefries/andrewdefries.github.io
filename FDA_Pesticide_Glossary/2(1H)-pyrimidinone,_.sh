library("knitr")

#knit("2(1H)-pyrimidinone,_.Rmd")
#markdownToHTML('2(1H)-pyrimidinone,_.md', '2(1H)-pyrimidinone,_.html', options=c("use_xhml"))
#system("pandoc -s 2(1H)-pyrimidinone,_.html -o 2(1H)-pyrimidinone,_.pdf")


knitr::knit2html('2(1H)-pyrimidinone,_.Rmd', "html_document")