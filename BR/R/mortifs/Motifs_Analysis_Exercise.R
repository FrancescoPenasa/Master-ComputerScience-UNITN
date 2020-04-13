### Load the package in the R environment
library(biomaRt)
library(MotifDb)
library(seqLogo)
library(PWMEnrich)
library(PWMEnrich.Hsapiens.background)

### set seed for replicability
set.seed(1)

### Connect to BioMart
ensembl <- useMart(biomart="ensembl",dataset="hsapiens_gene_ensembl")

### TASK 1

## a
selected_chr <- "2"
## b
query_df1 <- 
   getBM(attributes=c("ensembl_gene_id","version","external_gene_name","gene_biotype","start_position","end_position","chromosome_name","strand"),
         filters=c("chromosome_name"), 
         values=list(c(selected_chr)),
         mart = ensembl)
## c
query_df1 <- query_df1[which(query_df1$gene_biotype=="protein_coding"),]
## d
print(nrow(query_df1))


### TASK 2

## a
random_genes <- sample(query_df1$ensembl_gene_id,500,replace = FALSE)
promoter_seq <- getSequence(id = random_genes, 
                            type="ensembl_gene_id",
                            seqType="gene_flank",
                            upstream=30,
                            mart=ensembl) 

## b
pfm <- consensusMatrix(promoter_seq$gene_flank)
ppm <- apply(pfm,2,function(x) x/sum(x))

## c
seqLogo(ppm)

## d
downstream_seq <- getSequence(id = random_genes, 
                            type="ensembl_gene_id",
                            seqType="gene_flank",
                            downstream=30,
                            mart=ensembl) 

pfm_downstream <- consensusMatrix(downstream_seq$gene_flank)
ppm_downstream <- apply(pfm_downstream,2,function(x) x/sum(x))
seqLogo(ppm_downstream)


### TASK 3

## a
random_genes <- sample(query_df1$ensembl_gene_id,100,replace = FALSE)
promoter_seq <- getSequence(id = random_genes, 
                            type="ensembl_gene_id",
                            seqType="gene_flank",
                            upstream=300,
                            mart=ensembl) 

data(PWMLogn.hg19.MotifDb.Hsap)
sequences <- lapply(promoter_seq$gene_flank,function(x) DNAString(x))
enriched_TFs <- motifEnrichment(sequences,PWMLogn.hg19.MotifDb.Hsap,score = "affinity")
report = groupReport(enriched_TFs)
report
plot(report[1:5], fontsize=7, id.fontsize=5)

## b c
tfs = report$target[1:5]
fractions_99_9 = c()
for(i in 1:5)
{
   tfs_motifs = subset(MotifDb, organism=='Hsapiens' & geneSymbol==tfs[i])
   PWM = toPWM(as.list(tfs_motifs))
   ecdf = motifEcdf(PWM,organism = "hg19",quick=TRUE)
   thresholds = lapply(ecdf,function(x) quantile(x,0.999))
   scores = motifScores(sequences,PWM,raw.score=FALSE,cutoff=unlist(thresholds))
   fractions_99_9 = c(fractions_99_9,length(which(apply(scores,1,sum)>0))/100)
}

fractions_99 = c()
for(i in 1:5)
{
   tfs_motifs = subset(MotifDb, organism=='Hsapiens' & geneSymbol==tfs[i])
   PWM = toPWM(as.list(tfs_motifs))
   ecdf = motifEcdf(PWM,organism = "hg19",quick=TRUE)
   thresholds = lapply(ecdf,function(x) quantile(x,0.99))
   scores = motifScores(sequences,PWM,raw.score=FALSE,cutoff=unlist(thresholds))
   fractions_99 = c(fractions_99,length(which(apply(scores,1,sum)>0))/100)
}

