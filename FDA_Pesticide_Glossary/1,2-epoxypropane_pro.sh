library("knitr")

#knit("1,2-epoxypropane_pro.Rmd")
#markdownToHTML('1,2-epoxypropane_pro.md', '1,2-epoxypropane_pro.html', options=c("use_xhml"))
#system("pandoc -s 1,2-epoxypropane_pro.html -o 1,2-epoxypropane_pro.pdf")


knitr::knit2html('1,2-epoxypropane_pro.Rmd', "html_document")
