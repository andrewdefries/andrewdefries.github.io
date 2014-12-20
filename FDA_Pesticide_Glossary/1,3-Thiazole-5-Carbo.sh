library("knitr")

#knit("1,3-Thiazole-5-Carbo.Rmd")
#markdownToHTML('1,3-Thiazole-5-Carbo.md', '1,3-Thiazole-5-Carbo.html', options=c("use_xhml"))
#system("pandoc -s 1,3-Thiazole-5-Carbo.html -o 1,3-Thiazole-5-Carbo.pdf")


knitr::knit2html('1,3-Thiazole-5-Carbo.Rmd', "html_document")
