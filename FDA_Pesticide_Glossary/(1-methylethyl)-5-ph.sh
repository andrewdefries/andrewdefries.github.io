library("knitr")

#knit("(1-methylethyl)-5-ph.Rmd")
#markdownToHTML('(1-methylethyl)-5-ph.md', '(1-methylethyl)-5-ph.html', options=c("use_xhml"))
#system("pandoc -s (1-methylethyl)-5-ph.html -o (1-methylethyl)-5-ph.pdf")


knitr::knit2html('(1-methylethyl)-5-ph.Rmd', "html_document")
