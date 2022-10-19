library(picante)
samp1<- read.table("species_distribution_unique_for_pd.txt",sep = ",", header = T) 
samp2<- read.table("species_distribution_matrix.csv",sep = ",", header = T)
samp<-table(samp1)
phylo<- read.tree("RAxML_bestTree.tree")       

tip.not<- tip.all[!tip.all%in%(samp1[,2])]  ### tips not in the tree 
length(tip.not)  ###number of tips not in the tree 
tr.new<- drop.tip(phylo,tip.not)         #### match tips in the phylo and distribution 

# grid.pd<- pd(samp, tr.new)   ###计算PD


#计算ses.pd
grid.sespd<- ses.pd(samp2,tr.new,runs=999,iterations = 1000)
rst = cbind(grid.pd,grid.mpd,grid.sespd)
write.csv(rst,"grid.pd_mpd_new.csv")
