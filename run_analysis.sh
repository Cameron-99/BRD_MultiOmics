#!/bin/bash
echo "🚀 BRD Multi-Omics Pipeline v1.0 - Frontiers Genetics 2026"
echo "Hardware: i5-7500, 16GB RAM, Linux LMDE7"
echo "GitHub: github.com/Cameron-99/BRD_MultiOmics"

case "$1" in
  "toy")
    echo "✅ TOY TEST (2 min): data/toy_cohort.csv (20 cattle)"
    echo "   Run: snakemake toy_gwas --cores 2"
    ;;
  "full")
    echo "✅ FULL BENCHMARK (40 min): 143 cattle simulation"
    echo "   Run: snakemake all --cores 4"
    ;;
  *)
    echo "Usage: ./run_analysis.sh [toy|full]"
    exit 1
    ;;
esac
echo "💾 Outputs: TIFF figures (<10MB), Table_S1.csv"
