library("knitr")

#knit("1,2,3,4,5-pentachlor.Rmd")
#markdownToHTML('1,2,3,4,5-pentachlor.md', '1,2,3,4,5-pentachlor.html', options=c("use_xhml"))
#system("pandoc -s 1,2,3,4,5-pentachlor.html -o 1,2,3,4,5-pentachlor.pdf")


knitr::knit2html('1,2,3,4,5-pentachlor.Rmd', "html_document")
