#!/bin/bash
# ==============================================================
# Salmon Alignment Guide Using Trimmed FASTQ Files
# Platform: macOS Terminal
# Author: Menatallah Adel Abdelmagid
# Description: This tutorial-style Bash script contains the main
# commands used to perform transcript quantification with Salmon.
# Not designed to be run as-is. Use as a reference or copy/paste.
# Original script: salmon_using_trimmedFastqFiles_project.sh
# ==============================================================


# --------------------------------------------------------------
# Step 1: Install Salmon (if not already installed)
# --------------------------------------------------------------
# Install Salmon via Homebrew (macOS)
brew tap brewsci/bio
brew install salmon

# Verify Salmon installation
salmon --version


# --------------------------------------------------------------
# Step 2: Check if Salmon index exists, otherwise create one
# --------------------------------------------------------------
# Download Human cDNA FASTA File (Ensembl GRCh38, release 110)
wget ftp://ftp.ensembl.org/pub/release-110/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz

# Unzip the FASTA file
gunzip Homo_sapiens.GRCh38.cdna.all.fa.gz

# Create Salmon index
# Replace $human_index with your actual index output directory
salmon index -t Homo_sapiens.GRCh38.cdna.all.fa -i "$human_index" --threads 8


# --------------------------------------------------------------
# Step 3: Quantify gene expression for each sample
# --------------------------------------------------------------
# Run Salmon on trimmed paired-end FASTQ files
# Make sure to replace the variables with your real paths and sample names

salmon quant \
  -i "$human_index" \
  -l A \
  -1 "$sample_input_dir/${sample}_R1_trimmed.fq" \
  -2 "$sample_input_dir/${sample}_R2_trimmed.fq" \
  -o "$sample_output_dir/salmon_output"


# --------------------------------------------------------------
# Step 4: Generate a merged TPM count matrix
# --------------------------------------------------------------
# Move into the output directory containing multiple SRR subfolders

cd /Users/mennaadel/Downloads/transcriptome_final_project/salmon_output

# Merge quantification results using Salmon's quantmerge tool
# This creates a merged matrix with TPM values

salmon quantmerge \
  --quants SRR*/salmon_output \
  --names SRR* \
  --column TPM \
  -o merged_tpm.tsv
