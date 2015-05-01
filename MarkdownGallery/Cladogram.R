library(fmcsR)
library(ape)

sdfset<-read.SDFset("Query.sdf")
cid(sdfset)<-sdfid(sdfset)
d <- sapply(cid(sdfset), function(x)
fmcsBatch(sdfset[x], sdfset, au=0, bu=0,
matching.mode="aromatic")[,"Overlap_Coefficient"])

hc <- hclust(as.dist(1-d), method="complete")
hc[["labels"]] <- cid(sdfset)


png(file="hclust.png", width=800, height=600, units="px")

plot(as.phylo(hc), type = "fan")
dev.off()
#plot(as.dendrogram(hc), edgePar=list(col=4, lwd=2), horiz=TRUE, main=name)
