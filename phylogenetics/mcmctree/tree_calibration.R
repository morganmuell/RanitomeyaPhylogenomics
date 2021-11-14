#set working directory
setwd("~/RanitomeyaPhylogenomics/mcmctree")

#load the library
library(MCMCtreeR)

#Read in the tree - using the unpartitioned tree
frogtree <- read.tree("muscle-nexus-clean-70p_75p.treefile")

#remove branch lengths
frogtree$edge.length<-NULL

#find number of node label of the node with common ancestor of Ranitomeya and Andinobates
plot(frogtree, cex=0.5) #plot your tree with a smaller font to see labels
nodelabels() #view node label numbers

MinTime <- .07601 #minimum time for Andinobates-Ranitomeya node calculated before
names(MinTime) <- "node_2" #label with name of node seen above
MaxTime <- .17701 # maximum time for Andinobates-Ranitomeya calculated before
names(MaxTime) <- "node_2" #do the same with labeling
MonoGroup <- tipDes(frogtree, 2) #denotes monophyletic group at Andinobates-Ranitomeya LCA


#set uniform calibration node
uniform_results <- estimateBound(minAge = MinTime, maxAge = MaxTime, 
                                 monoGroups = MonoGroup, phy = frogtree,
                                 plot = FALSE)

#check numerical values to see if they make sense
uniform_results$parameters 


#check plot of set calibration
plotMCMCtree(uniform_results$parameters[1, ],
             method = "bound", title = "Uniform Andino-Ranito Node", 
             upperTime = MaxTime + 0.5)


#run calibration again and have it write an output newick file of the tree with the calibration node inserted
uniform_results <- estimateBound(minAge = MinTime, maxAge = MaxTime, monoGroups = MonoGroup, phy = frogtree, 
                                  plot = FALSE, writeMCMCtree=TRUE, MCMCtreeName='calibrated_tree.treefile')


