# Acinetobacter baumannii WGS — SRR41175570

## Data Source
- **Accession:** [SRR41175570](https://www.ncbi.nlm.nih.gov/sra/?term=SRR41175570)
- **Organism:** *Acinetobacter baumannii*
- **Platform:** Illumina (paired-end, 2×146 bp)
- **Study:** PRJNA1004324 — Genome sequencing of Gram-negative pathogens associated with nosocomial infections, Los Angeles County Department of Public Health
- **Local filename:** `SRR570.fastq` (shorthand used throughout for convenience)

> **Note:** The SRA run is **paired-end**, but analysis was performed on the combined FASTQ (treated as single-end). This is valid for assembly and typing.

## Pipeline & Results

| Step | Tool | Result |
|---|---|---|
| Quality control | FastQC | ~993k reads, 145.1 Mbp, Q30+, 0% adapter |
| Assembly | SPAdes (`--careful --phred-offset 33`) | 3.9 Mb, 102 contigs, **N50 = 105 kb** |
| Assembly QC | QUAST | GC 38.9%, 0 N's/100 kbp |
| Annotation | Prokka | **3,724 CDS**, 67 tRNAs, 7 rRNAs |
| Typing | MLST (Pasteur scheme) | **ST2 — International Clone II** |
| AMR profiling | AMRFinderPlus | **MDR profile** (see below) |

## Key Findings

### MLST
Pasteur ST2 — a globally disseminated, hospital-associated multidrug-resistant lineage.

### AMR Genes
- **blaOXA-23** — acquired carbapenemase (major clinical concern)
- **blaOXA-66** — intrinsic OXA-51-like (expected)
- **blaADC-223** — intrinsic AmpC (expected)
- **armA** — pan-aminoglycoside resistance
- **sul1**, **tet(B)**, **msr(E)/mph(E)**, **catB8**, **aadA1**, **aph(3')-Ia**, **ant(3'')-IIa**

> **Note:** NODE_51 carries a cluster of 9 resistance genes (class 1 integron/transposon), indicating a mobile MDR element.

## Reproduce
```bash
# QC
fastqc SRR570.fastq -o fastqcoutput

# Assembly
spades.py -s SRR570.fastq -o spadesoutput --careful -t 4 -m 8 --phred-offset 33

# Assembly QC
quast.py spadesoutput/contigs.fasta -o quastreport

# Annotation
prokka spadesoutput/contigs.fasta --outdir prokkaoutput --prefix SRR570 --kingdom Bacteria --cpus 4

# MLST
mlst --scheme abaumannii_2 spadesoutput/contigs.fasta > mlst_pasteur.txt

# AMR
amrfinder -n spadesoutput/contigs.fasta -d amrfinderdb/2026-10-29.1 -o amrresult.tsv --plus
