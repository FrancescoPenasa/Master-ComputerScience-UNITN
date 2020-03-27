# Exercise 2
# Find all the dna exon sequences for the list of exons identified in the previous exercise.
# Assign to each exon its sequence and order all exons by rank.
# Plot the distribution of sequence lengths per rank.

library(biomaRt)
ensembl <- useMart(biomart="ensembl",dataset="hsapiens_gene_ensembl")

# retrieve all available filters in a dataset
filters = listFilters(ensembl)
head(filters)
dim(filters)

# retrieve all available attributes in a dataset
attributes = listAttributes(ensembl)
help(listAttributes)
head(attributes)
dim(attributes)

query2 <- getBM(attributes=c("ensembl_transcript_id","ensembl_exon_id","rank","exon_chrom_start","exon_chrom_end"),
                filters=c("external_gene_name"),
                values=c("TP53"),
                mart=ensembl)

# Find all the dna exon sequences for the list of exons identified in the previous exercise.
seq2 <- getSequence(id = query2$ensembl_exon_id,
                    type = "ensembl_exon_id",
                    seqType = "gene_exon",
                    mart=ensembl)

dim(seq2)
length(unique(query2$ensembl_exon_id))
colnames(seq2)
colnames(query2)

# Assign to each exon its sequence and order all exons by rank.
merged_df <- merge(query2,seq2,by = "ensembl_exon_id")
merged_df <- merged_df[order(merged_df$rank),]

# Plot the distribution of sequence lengths per rank.
boxplot(sapply(merged_df$gene_exon,nchar)~merged_df$rank,
        xlab="exon rank",ylab="length (nt)",main="TP53")