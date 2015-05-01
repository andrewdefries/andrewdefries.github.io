library(ChemmineR)

sdfset<-read.SDFset("Query.sdf")
cid(sdfset)<-sdfid(sdfset)
apset<-sdf2ap(sdfset)
clusters <- cmp.cluster(apset, cutoff = c(0.75))
coord<-cluster.visualize(apset,clusters, size.cutoff=1, dimensions=3, quiet=TRUE)

save(coord, file="Query_coord.rda", compress=T)
