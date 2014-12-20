library("knitr")

#knit("1-(1-methylcycloprop.Rmd")
#markdownToHTML('1-(1-methylcycloprop.md', '1-(1-methylcycloprop.html', options=c("use_xhml"))
#system("pandoc -s 1-(1-methylcycloprop.html -o 1-(1-methylcycloprop.pdf")


knitr::knit2html('1-(1-methylcycloprop.Rmd', "html_document")
