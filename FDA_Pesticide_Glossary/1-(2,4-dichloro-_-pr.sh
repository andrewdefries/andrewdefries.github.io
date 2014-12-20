library("knitr")

#knit("1-(2,4-dichloro-_-pr.Rmd")
#markdownToHTML('1-(2,4-dichloro-_-pr.md', '1-(2,4-dichloro-_-pr.html', options=c("use_xhml"))
#system("pandoc -s 1-(2,4-dichloro-_-pr.html -o 1-(2,4-dichloro-_-pr.pdf")


knitr::knit2html('1-(2,4-dichloro-_-pr.Rmd', "html_document")
