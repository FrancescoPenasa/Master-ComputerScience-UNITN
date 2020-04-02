# a) Select a chromosome. 
# b) Find basic annotations for all the human genes on the chromosome you selected. 
# c) Select only protein coding genes. 
# d) How many genes do you find?

# Load libraries
library(biomaRt)
library(MotifDb)
library(seqLogo)
library(PWMEnrich)
library(PWMEnrich.Hsapiens.background)

ensembl <- useEnsembl(biomart = "ensembl",dataset = "hsapiens_gene_ensembl",mirror = "useast")

filters = listFilters(ensembl)
head(filters)
attributes = listAttributes(ensembl)
attributes

query1 <- getBM(attributes=c("ensembl_peptide_id"),
                filters=c("chromosome_name"), 
                values=list(c("21")),
                mart = ensembl)

dim(query1)
