#script to count parsimony informative sites and output to csv
#load phyloch
library(phyloch)

#setwd where the reads are
setwd("/home/bender/Desktop/Morgan/morgan_ranitomeya_tree/5_taxon-sets/final_dataset2/muscle-nexus-clean-70p")


#get list of file names and number of files
listoffiles <- list.files(pattern="*.nex*")
nooffiles <- length(listoffiles)

#these are the column names
record <- c("locusname","pis","length")

#loop to calculate PIS and write the PIS info to a text file
for (j in 1:nooffiles) {
  write.table((gsub("?","N",(readLines(listoffiles[j])),fixed=TRUE)),"list_of_pis_by_locus.txt",sep="",quote=FALSE,row.names=FALSE,col.names=FALSE)
  tempfile <- read.nex("list_of_pis_by_locus.txt")
  templength <- dim(tempfile)[2]
  temppis <- pis(tempfile)
  temp <- cbind(listoffiles[j],temppis,templength)
  record <- rbind(record,temp)
}

#add column names to text file
write.table(record, "list_of_pis_by_locus.txt",quote=FALSE, row.names=FALSE,col.names=FALSE)

#filter to top 75% most informative loci
loci <- read.table(file="list_of_pis_by_locus.txt", header=TRUE)
plot(loci$pis)
1568*0.75 #1176 loci in top 75%
loci_sorted <- loci[order(-loci$pis),]
loci_sorted_truncated <- loci_sorted[1:1176,]
length(loci_sorted_truncated$pis) #calculate the number of informative loci
sum(loci_sorted_truncated$pis) #calculate the number of parsimony informative sites
top75pinform <- loci_sorted_truncated$locusname
write.table(top75pinform, file="top75pnames.txt")


