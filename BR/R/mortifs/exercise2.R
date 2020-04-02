# a) Collect the promoter regions of 500 random genes. 
## consider a window of 30 nucleotides upstream and use the "sample" function to extract the ensembl_gene_id of the 500 random genes. 
## Set "seqType" parameter to "gene_flank". 
# b) Build the PFM from the sequences and compute the PPM ??? Use the function "consensusMatrix" applied on the vector of sequences. 
# c) Generate the logo 
# d) For the same genes, now generate the logo of the downstream 30 nucleotides. 
# e) Do you see differences between the upstream and the downstream region of your genes?

library(biomaRt)
library(MotifDb)
library(seqLogo)
library(PWMEnrich)
library(PWMEnrich.Hsapiens.background)

ensembl <- useEnsembl(biomart = "ensembl",dataset = "hsapiens_gene_ensembl",mirror = "useast")

filters = listFilters(ensembl)
attributes = listAttributes(ensembl)

query1 <- getBM(attributes=c("ensembl_gene_id"), seqtype("gene_flank"),
                filters=c("chromosome_name"), 
                values=list(c("21")),
                mart = ensembl)

dim(query1)

rnd_genes = sample(query1, size = 500, replace = TRUE)
