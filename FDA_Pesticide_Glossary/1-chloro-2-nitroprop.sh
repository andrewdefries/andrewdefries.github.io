library("knitr")

#knit("1-chloro-2-nitroprop.Rmd")
#markdownToHTML('1-chloro-2-nitroprop.md', '1-chloro-2-nitroprop.html', options=c("use_xhml"))
#system("pandoc -s 1-chloro-2-nitroprop.html -o 1-chloro-2-nitroprop.pdf")


knitr::knit2html('1-chloro-2-nitroprop.Rmd', "html_document")
