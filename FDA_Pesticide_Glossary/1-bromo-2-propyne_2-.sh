library("knitr")

#knit("1-bromo-2-propyne_2-.Rmd")
#markdownToHTML('1-bromo-2-propyne_2-.md', '1-bromo-2-propyne_2-.html', options=c("use_xhml"))
#system("pandoc -s 1-bromo-2-propyne_2-.html -o 1-bromo-2-propyne_2-.pdf")


knitr::knit2html('1-bromo-2-propyne_2-.Rmd', "html_document")