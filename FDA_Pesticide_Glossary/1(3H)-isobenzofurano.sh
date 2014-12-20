library("knitr")

#knit("1(3H)-isobenzofurano.Rmd")
#markdownToHTML('1(3H)-isobenzofurano.md', '1(3H)-isobenzofurano.html', options=c("use_xhml"))
#system("pandoc -s 1(3H)-isobenzofurano.html -o 1(3H)-isobenzofurano.pdf")


knitr::knit2html('1(3H)-isobenzofurano.Rmd', "html_document")
