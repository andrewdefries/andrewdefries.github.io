library("knitr")

#knit("1-(2,4-dichloroanili.Rmd")
#markdownToHTML('1-(2,4-dichloroanili.md', '1-(2,4-dichloroanili.html', options=c("use_xhml"))
#system("pandoc -s 1-(2,4-dichloroanili.html -o 1-(2,4-dichloroanili.pdf")


knitr::knit2html('1-(2,4-dichloroanili.Rmd', "html_document")
