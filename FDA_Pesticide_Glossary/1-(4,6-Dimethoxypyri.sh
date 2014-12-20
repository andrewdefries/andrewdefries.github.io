library("knitr")

#knit("1-(4,6-Dimethoxypyri.Rmd")
#markdownToHTML('1-(4,6-Dimethoxypyri.md', '1-(4,6-Dimethoxypyri.html', options=c("use_xhml"))
#system("pandoc -s 1-(4,6-Dimethoxypyri.html -o 1-(4,6-Dimethoxypyri.pdf")


knitr::knit2html('1-(4,6-Dimethoxypyri.Rmd', "html_document")
