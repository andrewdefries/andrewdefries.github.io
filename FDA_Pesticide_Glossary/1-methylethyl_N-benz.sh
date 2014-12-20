library("knitr")

#knit("1-methylethyl_N-benz.Rmd")
#markdownToHTML('1-methylethyl_N-benz.md', '1-methylethyl_N-benz.html', options=c("use_xhml"))
#system("pandoc -s 1-methylethyl_N-benz.html -o 1-methylethyl_N-benz.pdf")


knitr::knit2html('1-methylethyl_N-benz.Rmd', "html_document")
