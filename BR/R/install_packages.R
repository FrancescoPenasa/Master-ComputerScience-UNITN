if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biomaRt")
BiocManager::install("MotifDb")
BiocManager::install("seqLogo")
BiocManager::install("PWMEnrich")
BiocManager::install("PWMEnrich.Hsapiens.background")
