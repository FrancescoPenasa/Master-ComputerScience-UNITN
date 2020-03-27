# Load the package in the R environment
library(biomaRt)

ensembl <- useEnsembl(biomart = "ensembl",dataset = "hsapiens_gene_ensembl",mirror = "useast")


# Exercise 1
# Find all the exons corresponding to the TP53 gene,
# with start and end coordinates and the transcript rank.
# How many transcripts include an exon starting at position 7676521?

query2 <- getBM(attributes=c("ensembl_transcript_id","ensembl_exon_id","rank","exon_chrom_start","exon_chrom_end"),
                filters=c("external_gene_name"),
                values=c("TP53"),
                mart=ensembl)

with_exon <- query2$ensembl_transcript_id[which(query2$exon_chrom_start==7676521)]
tot <- unique(query2$ensembl_transcript_id)
length(with_exon)/length(tot)

# Exercise 2
# Find all the dna exon sequences for the list of exons identified in the previous exercise.
# Assign to each exon its sequence and order all exons by rank.
# Plot the distribution of sequence lengths per rank.


seq2 <- getSequence(id = query2$ensembl_exon_id,
                    type = "ensembl_exon_id",
                    seqType = "gene_exon",
                    mart=ensembl)

dim(seq2)
length(unique(query2$ensembl_exon_id))
colnames(seq2)
colnames(query2)


merged_df <- merge(query2,seq2,by = "ensembl_exon_id")
merged_df <- merged_df[order(merged_df$rank),]

boxplot(sapply(merged_df$gene_exon,nchar)~merged_df$rank,
        xlab="exon rank",ylab="length (nt)",main="TP53")

