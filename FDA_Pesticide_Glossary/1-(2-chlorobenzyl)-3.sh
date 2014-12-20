library("knitr")

#knit("1-(2-chlorobenzyl)-3.Rmd")
#markdownToHTML('1-(2-chlorobenzyl)-3.md', '1-(2-chlorobenzyl)-3.html', options=c("use_xhml"))
#system("pandoc -s 1-(2-chlorobenzyl)-3.html -o 1-(2-chlorobenzyl)-3.pdf")


knitr::knit2html('1-(2-chlorobenzyl)-3.Rmd', "html_document")
