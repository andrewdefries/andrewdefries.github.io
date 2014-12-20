library("knitr")

#knit("amino_sulfonic_acid.Rmd")
#markdownToHTML('amino_sulfonic_acid.md', 'amino_sulfonic_acid.html', options=c("use_xhml"))
#system("pandoc -s amino_sulfonic_acid.html -o amino_sulfonic_acid.pdf")


knit2html('amino_sulfonic_acid.Rmd')
