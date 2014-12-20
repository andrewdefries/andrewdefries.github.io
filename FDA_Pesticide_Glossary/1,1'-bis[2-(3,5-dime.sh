library("knitr")

#knit("1,1'-bis[2-(3,5-dime.Rmd")
#markdownToHTML('1,1'-bis[2-(3,5-dime.md', '1,1'-bis[2-(3,5-dime.html', options=c("use_xhml"))
#system("pandoc -s 1,1'-bis[2-(3,5-dime.html -o 1,1'-bis[2-(3,5-dime.pdf")


knitr::knit2html('1,1'-bis[2-(3,5-dime.Rmd', "html_document")
