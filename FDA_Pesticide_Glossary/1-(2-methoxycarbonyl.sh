library("knitr")

#knit("1-(2-methoxycarbonyl.Rmd")
#markdownToHTML('1-(2-methoxycarbonyl.md', '1-(2-methoxycarbonyl.html', options=c("use_xhml"))
#system("pandoc -s 1-(2-methoxycarbonyl.html -o 1-(2-methoxycarbonyl.pdf")


knitr::knit2html('1-(2-methoxycarbonyl.Rmd', "html_document")
