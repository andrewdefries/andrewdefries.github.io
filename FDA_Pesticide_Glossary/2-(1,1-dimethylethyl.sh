library("knitr")

#knit("2-(1,1-dimethylethyl.Rmd")
#markdownToHTML('2-(1,1-dimethylethyl.md', '2-(1,1-dimethylethyl.html', options=c("use_xhml"))
#system("pandoc -s 2-(1,1-dimethylethyl.html -o 2-(1,1-dimethylethyl.pdf")


knitr::knit2html('2-(1,1-dimethylethyl.Rmd', "html_document")
