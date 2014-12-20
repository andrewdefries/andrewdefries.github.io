library("knitr")

#knit("1,1'-(2,2-dichloroet.Rmd")
#markdownToHTML('1,1'-(2,2-dichloroet.md', '1,1'-(2,2-dichloroet.html', options=c("use_xhml"))
#system("pandoc -s 1,1'-(2,2-dichloroet.html -o 1,1'-(2,2-dichloroet.pdf")


knitr::knit2html('1,1'-(2,2-dichloroet.Rmd', "html_document")
