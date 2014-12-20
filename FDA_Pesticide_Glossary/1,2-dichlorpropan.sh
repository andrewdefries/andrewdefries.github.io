library("knitr")

#knit("1,2-dichlorpropan.Rmd")
#markdownToHTML('1,2-dichlorpropan.md', '1,2-dichlorpropan.html', options=c("use_xhml"))
#system("pandoc -s 1,2-dichlorpropan.html -o 1,2-dichlorpropan.pdf")


knitr::knit2html('1,2-dichlorpropan.Rmd', "html_document")
