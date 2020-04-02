# a) Find the top five TFs that are enriched in a collection of promoters. 
## Generate the collection of promoters using the same code implemented in the previous task, 
## but using a window of 300 nucleotides upstream and only 100 genes.
## Use function "groupReport" to find TF enrichments across many sequences. 
# b) Compute empirical distributions of scores for all PWMs that you find in MotifDB for the previously 
## selected top five TFs and determine for all of them the distribution (log2) threshold cutoff at 99.9%. 
# c) Calculate for each TF the fraction of the collected promoters having at least one binding score 
## above the computed threshold for any of the TF related PWM matrices. 
## Use pattern matching function motifsScore with raw.score=FALSE and setting the parameter cutoff. 
# d) Calculate again the fractions using threshold cutoffs at 99%.

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
