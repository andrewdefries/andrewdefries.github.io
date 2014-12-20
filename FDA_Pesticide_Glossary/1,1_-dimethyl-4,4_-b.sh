library("knitr")

#knit("1,1_-dimethyl-4,4_-b.Rmd")
#markdownToHTML('1,1_-dimethyl-4,4_-b.md', '1,1_-dimethyl-4,4_-b.html', options=c("use_xhml"))
#system("pandoc -s 1,1_-dimethyl-4,4_-b.html -o 1,1_-dimethyl-4,4_-b.pdf")


knitr::knit2html('1,1_-dimethyl-4,4_-b.Rmd', "html_document")
