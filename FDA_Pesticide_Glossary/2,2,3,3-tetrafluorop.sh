library("knitr")

#knit("2,2,3,3-tetrafluorop.Rmd")
#markdownToHTML('2,2,3,3-tetrafluorop.md', '2,2,3,3-tetrafluorop.html', options=c("use_xhml"))
#system("pandoc -s 2,2,3,3-tetrafluorop.html -o 2,2,3,3-tetrafluorop.pdf")


knitr::knit2html('2,2,3,3-tetrafluorop.Rmd', "html_document")
