library("knitr")

#knit("113-48-4.Rmd")
#markdownToHTML('113-48-4.md', '113-48-4.html', options=c("use_xhml"))
#system("pandoc -s 113-48-4.html -o 113-48-4.pdf")


knitr::knit2html('113-48-4.Rmd', "html_document")
