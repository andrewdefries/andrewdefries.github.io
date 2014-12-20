library("knitr")

#knit("1-Naphthaleneacetami.Rmd")
#markdownToHTML('1-Naphthaleneacetami.md', '1-Naphthaleneacetami.html', options=c("use_xhml"))
#system("pandoc -s 1-Naphthaleneacetami.html -o 1-Naphthaleneacetami.pdf")


knitr::knit2html('1-Naphthaleneacetami.Rmd', "html_document")
