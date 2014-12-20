library(knitr)

knit("testrgl.Rmd")
markdownToHTML('testrgl.md', 'testrgl.html', options=c("use_xhml"))
system("pandoc -s testrlg.html -o testrgl.pdf")


