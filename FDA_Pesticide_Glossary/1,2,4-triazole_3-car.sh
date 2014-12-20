library("knitr")

#knit("1,2,4-triazole_3-car.Rmd")
#markdownToHTML('1,2,4-triazole_3-car.md', '1,2,4-triazole_3-car.html', options=c("use_xhml"))
#system("pandoc -s 1,2,4-triazole_3-car.html -o 1,2,4-triazole_3-car.pdf")


knitr::knit2html('1,2,4-triazole_3-car.Rmd', "html_document")
