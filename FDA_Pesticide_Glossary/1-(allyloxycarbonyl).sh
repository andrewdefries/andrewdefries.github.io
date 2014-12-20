library("knitr")

#knit("1-(allyloxycarbonyl).Rmd")
#markdownToHTML('1-(allyloxycarbonyl).md', '1-(allyloxycarbonyl).html', options=c("use_xhml"))
#system("pandoc -s 1-(allyloxycarbonyl).html -o 1-(allyloxycarbonyl).pdf")


knitr::knit2html('1-(allyloxycarbonyl).Rmd', "html_document")
