# Install biomaRt R package
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("biomaRt")

# Load the package in the R environment
library(biomaRt)

# explore the package vignette
browseVignettes("biomaRt")

# display available databases
listMarts()

# connect to a specific BioMart database 
ensembl <- useMart("ENSEMBL_MART_ENSEMBL")
# or for genes just use
ensembl <- useMart("ensembl")

# display all available datasets
y <- listDatasets(ensembl)
head(y)

# select a dataset
ensembl <- useDataset("hsapiens_gene_ensembl",mart=ensembl)

# or combine with 
ensembl <- useMart(biomart="ensembl",dataset="hsapiens_gene_ensembl")
ensembl <- useEnsembl(biomart = "ensembl",dataset = "hsapiens_gene_ensembl",mirror = "useast")

# retrieve all available filters in a dataset
filters = listFilters(ensembl)
head(filters)
dim(filters)

# retrieve all available attributes in a dataset
attributes = listAttributes(ensembl)
head(attributes)
dim(attributes)
table(attributes$page)

# The getBM() function is the main query function in biomaRt
help(getBM)

# Find basic annotation for all genes on chromosomes 21 
query1 <- getBM(attributes=c("ensembl_gene_id",
                             "external_gene_name",
                             "gene_biotype",
                             "transcript_count",
                             "start_position",
                             "end_position",
                             "chromosome_name",
                             "strand",
                             "description",
                             "version"),
                filters=c("chromosome_name"), 
                values=list(c("21")),
                mart = ensembl)

head(query1)
dim(query1)
sort(table(query1$gene_biotype),decreasing=T)

# Select protein coding genes
query1_protein_coding <- query1[which(query1$gene_biotype=="protein_coding"),]

# Create a gene model 
gene_model <- data.frame(chr=rep("21",nrow(query1_protein_coding)),
                         start=query1_protein_coding$start_position,
                         end=query1_protein_coding$end_position,
                         ensemblID=query1_protein_coding$ensembl_gene_id,stringsAsFactors=F)

write.table(gene_model, "~/Desktop/GeneModel.bed",sep="\t",row.names=F,quote=F)

# All sequence related queries to Ensembl are available through the getSequence() wrapper function
help("getSequence")

# Find all the DNA sequences for genes identified in the previous query
seq1 <- getSequence(id = sample(query1$external_gene_name,size = 100), 
                    type="hgnc_symbol",
                    seqType="cdna",
                    mart=ensembl) 
dim(seq1)
colnames(seq1)
boxplot(sapply(seq1$cdna,nchar),log="y")
barplot(sort(sapply(seq1$cdna,nchar)),names.arg = seq1$hgnc_symbol,las=2,cex.names=0.7)

# Exercise 1
# Find all the exons corresponding to the TP53 gene,
# with start and end coordinates and the transcript rank.
# How many transcripts include an exon starting at position 7676521?
#
# Exercise 2
# Find all the dna exon sequences for the list of exons identified in the previous exercise.
# Assign to each exon its sequence and order all exons by rank.
# Plot the distribution of sequence lengths per rank.

