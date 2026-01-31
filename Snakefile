import os

PROJECT_DIR = "/home/cameron/BRD_MultiOmics_Project"
RAW_DIR = f"{PROJECT_DIR}/data/raw"
QC_DIR = f"{PROJECT_DIR}/data/qc"

rule all:
    input: f"{QC_DIR}/multiqc_report.html"

rule download_sample_sra:
    output: f"{RAW_DIR}/sra_mbovis/SRR12968365_1.fastq"
    shell:
        """
        mkdir -p $(dirname {output})
        cd $(dirname {output})
        prefetch SRR12968365
        fasterq-dump SRR12968365 --split-files
        cd -
        """

rule fastqc:
    input: rules.download_sample_sra.output
    output: 
        html=f"{QC_DIR}/SRR12968365_1_fastqc.html",
        zip=f"{QC_DIR}/SRR12968365_1_fastqc.zip"
    shell:
        """
        mkdir -p $(dirname {output.html})
        fastqc {input} -o $(dirname {output.html})
        """

rule multiqc:
    input: rules.fastqc.output.html
    output: f"{QC_DIR}/multiqc_report.html"
    shell:
        """
        mkdir -p $(dirname {output})
        multiqc $(dirname {input}) -o $(dirname {output}) -n multiqc_report --force
        mv $(dirname {{output}})/multiqc_report_1.html {{output}} 2>/dev/null || true
        """
