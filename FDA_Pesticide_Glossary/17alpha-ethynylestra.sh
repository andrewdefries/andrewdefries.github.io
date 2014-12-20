library("knitr")

#knit("17alpha-ethynylestra.Rmd")
#markdownToHTML('17alpha-ethynylestra.md', '17alpha-ethynylestra.html', options=c("use_xhml"))
#system("pandoc -s 17alpha-ethynylestra.html -o 17alpha-ethynylestra.pdf")


knitr::knit2html('17alpha-ethynylestra.Rmd', "html_document")
