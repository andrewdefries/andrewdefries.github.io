library("knitr")

#knit("1-[2-(2,4-dichlorphe.Rmd")
#markdownToHTML('1-[2-(2,4-dichlorphe.md', '1-[2-(2,4-dichlorphe.html', options=c("use_xhml"))
#system("pandoc -s 1-[2-(2,4-dichlorphe.html -o 1-[2-(2,4-dichlorphe.pdf")


knitr::knit2html('1-[2-(2,4-dichlorphe.Rmd', "html_document")
