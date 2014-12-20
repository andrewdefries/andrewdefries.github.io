library("knitr")

#knit("1a,1b,5,5a,6,6a-hexa.Rmd")
#markdownToHTML('1a,1b,5,5a,6,6a-hexa.md', '1a,1b,5,5a,6,6a-hexa.html', options=c("use_xhml"))
#system("pandoc -s 1a,1b,5,5a,6,6a-hexa.html -o 1a,1b,5,5a,6,6a-hexa.pdf")


knitr::knit2html('1a,1b,5,5a,6,6a-hexa.Rmd', "html_document")
