library(knitr)
library(markdown)
library(rgl)
library(parallel)

knit2html("myquery.Rmd")
markdownToHTML('myquery.md', 'myquery.html', options=c("use_xhml"))
#system("pandoc -s testrlg.html -o testrgl.pdf")


