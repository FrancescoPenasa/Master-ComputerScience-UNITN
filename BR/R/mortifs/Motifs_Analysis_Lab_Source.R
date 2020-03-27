# Load libraries
# The additional library I mentioned in the slides is not needed
library(MotifDb)
library(seqLogo)
library(PWMEnrich)

# How many motifs
length(MotifDb)

# See sources
sort(table(values(MotifDb)$dataSource),decreasing=TRUE)

# See organisms
sort(table(values(MotifDb)$organism),decreasing=TRUE)

# Which are the metadata
colnames(values(MotifDb))

# Perform a query
res <- query(MotifDb,'hsapiens')
names(res)[1]
res[[1]]

# Query a TF name
res <- query(MotifDb,'sox')
names(res)

# Query with grep
mdb.human <- MotifDb[grep('Hsapiens',values(MotifDb)$organism)]
mdb.sox <- MotifDb[grep('sox',values(MotifDb)$geneSymbol,ignore.case=TRUE)]

# Results for SOX are different
length(res)
length(mdb.sox)

# Seach what is missing
names(res)[which(!names(res)%in%names(mdb.sox))]
x = values(MotifDb)[grep('MA0084.1',values(MotifDb)$providerId,ignore.case=TRUE),]

# Using function subset
mdb.human = subset(MotifDb, organism=='Hsapiens')
mdb.human.tp53 = subset(MotifDb, organism=='Hsapiens' & geneSymbol=="TP53")
mdb.human.tp53.jaspar = subset(MotifDb, organism=='Hsapiens' & geneSymbol=="TP53" & dataSource=='JASPAR_CORE')
motifs = as.list(mdb.human.tp53.jaspar)
motifs = as.list(mdb.human.tp53)

# Create a logo
seqLogo(motifs[[1]])
seqLogo(motifs[[1]],ic.scale = FALSE)

# Create a random sequence
set.seed(3)
seq = DNAString(paste(sample(c("A","C","G","T"),500,replace = T),collapse=""))

# Motifs enrichment
pwms = sapply(as.list(mdb.human.tp53),toPWM)
res = motifEnrichment(seq,pwms,score = "affinity")
data(PWMLogn.hg19.MotifDb.Hsap)
# Calculating motif enrichment scores
res = motifEnrichment(seq,PWMLogn.hg19.MotifDb.Hsap,score = "affinity")
report = sequenceReport(res, 1)
report
plot(report[report$p.value < 0.05], fontsize=7, id.fontsize=6)

# Pattern matching
mdb.human.arid5b = subset(MotifDb, organism=='Hsapiens' & geneSymbol=="ARID5B")
PWM = toPWM(as.list(mdb.human.arid5b))
names(PWM) = sapply(names(PWM),function(x) strsplit(x,"-")[[1]][3])
scores = motifScores(seq,PWM,raw.score=TRUE)
plotMotifScores(scores,cols=c("red","green","blue"),legend.space = 0.1)

# Empirical distribution for the motif
ecdf = motifEcdf(PWM,organism = "hg19",quick=TRUE)
threshold = log2(quantile(ecdf$M3574_1.02,1-1e-3))
threshold
plotMotifScores(scores,sel.motifs="M3574_1.02",cols=c("red","green","blue"),cutoff=threshold)




