library(GenomicRanges)
gr <- GRanges(
    seqnames = c("chr17", "chr17", "chr7", "chrMT", "chr7"),
    ranges = IRanges(
      start = c(7668402, 43044295, 55019031, 5904, 5522300),
      end   = c(7687550, 43170245, 55211628, 7445, 5526350)
    ),
    strand = c("-", "-", "+", "+", "-"),
    gene_name = c("TP53", "BRCA1", "EGFR", "MT-CO1", "ACTB"),
    expression = c("niska", "niska", "zmienna", "bardzo wysoka", "wysoka")
)
print(gr)
width(gr)
subset(gr)
table(seqnames(gr))