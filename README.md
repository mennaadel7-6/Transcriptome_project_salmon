Transcriptome Project (Salmon_alignment bash script)
#  RNA-Seq Quantification with Salmon (macOS)

This repository includes  Bash scripts related to transcript quantification using **Salmon** and **trimmed paired-end FASTQ files**. 
---

##  Files Included

| File | Description |
|------|-------------|
| `salmon_using_trimmedFastqFiles_project.sh` | Script designed to be run step-by-step for real data |
| `salmon_alignment_guide.sh` | Commented tutorial-style Bash script with explanations |

---

##  Overview

### 1 `salmon_using_trimmedFastqFiles_project.sh`

This is a runnable script containing the main pipeline steps for:
- Indexing the transcriptome using Salmon
- Quantifying gene expression from trimmed FASTQ files
- Merging TPM results

Use this when you want to run the workflow on real data.

---

### 2  `salmon_alignment_guide.sh`

This is a **reference/tutorial script** with all main commands used in the workflow.  
It includes detailed comments (`#`) to explain what each step does.

Use this as a personal learning tool or share it as a guide for others.

---

##  Tools Used

- **Salmon** — transcript quantification
- **wget**, **gunzip** — file handling
- **macOS Terminal** (Bash)

---

##  Pipeline Summary

1. Install Salmon (if not installed)
2. Download reference transcriptome (GRCh38)
3. Build Salmon index
4. Quantify reads per sample
5. Merge TPM outputs to generate a count matrix

---

## Author

**Menatallah Adel Abdelmagid ** — Bioinformatician  


