# Exercise 1
# Find all the exons corresponding to the TP53 gene,
# with start and end coordinates and the transcript rank.
# How many transcripts include an exon starting at position 7676521?

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

# Find all the exons corresponding to the TP53 gene, with start and end coordinates and the transcript rank.
query2 <- getBM(attributes=c("ensembl_transcript_id","ensembl_exon_id","rank","exon_chrom_start","exon_chrom_end"),
                filters=c("external_gene_name"),
                values=c("TP53"),
                mart=ensembl)

# How many transcripts include an exon starting at position 7676521?
with_exon <- query2$ensembl_transcript_id[which(query2$exon_chrom_start==7676521)]
tot <- unique(query2$ensembl_transcript_id)
length(with_exon)/length(tot)
