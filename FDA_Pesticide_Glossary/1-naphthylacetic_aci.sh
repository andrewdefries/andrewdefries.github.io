library("knitr")

#knit("1-naphthylacetic_aci.Rmd")
#markdownToHTML('1-naphthylacetic_aci.md', '1-naphthylacetic_aci.html', options=c("use_xhml"))
#system("pandoc -s 1-naphthylacetic_aci.html -o 1-naphthylacetic_aci.pdf")


knitr::knit2html('1-naphthylacetic_aci.Rmd', "html_document")
