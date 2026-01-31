# Field-Deployable BRD Multi-Omics Pipeline

**Frontiers Genetics** (submitted Feb 2026)  
**Cameron-99/BRD_MultiOmics v1.0** - DOI-ready archive

Complete Snakemake pipeline for Bovine Respiratory Disease (BRD) multi-omics analysis  
**Hardware:** Intel i5, 16GB RAM, Linux (tested LMDE7 Cinnamon)  
**Runtime:** 40 minutes full analysis, 2 minutes toy test

## 🎯 For Veterinarians & Breeders

**Three steps to BRD resistance markers:**

```bash
# 1. Prepare your data (VCF + expression TSV + BRD status CSV)
# 2. Run pipeline  
chmod +x run_analysis.sh
./run_analysis.sh your_cohort
# 3. Extract markers from figures/gwas_lead_snps.csv
