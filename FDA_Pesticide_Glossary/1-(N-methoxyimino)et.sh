library("knitr")

#knit("1-(N-methoxyimino)et.Rmd")
#markdownToHTML('1-(N-methoxyimino)et.md', '1-(N-methoxyimino)et.html', options=c("use_xhml"))
#system("pandoc -s 1-(N-methoxyimino)et.html -o 1-(N-methoxyimino)et.pdf")


knitr::knit2html('1-(N-methoxyimino)et.Rmd', "html_document")
