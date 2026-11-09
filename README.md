# Comparative Whole-Genome Analysis of *Acinetobacter baumannii*

## Key findings
- Paired-end-aware assembly produced **92 contigs** compared with **102** in the unpaired-read workflow, with a higher N50 (**113,506 bp vs. 105,017 bp**).
- Both assemblies yielded the same **21 AMRFinderPlus gene symbols/elements**, including *bla*<sub>OXA-23</sub>, *bla*<sub>OXA-66</sub> and *armA*.
- VFDB analysis identified **119 hits representing 118 unique gene names**, with the same gene profile in both assemblies.
- Biofilm-associated findings included *abaI, abaR, adeF, adeG, adeH* and the *pgaABCD* cluster; *bfmRS* was also detected as a biofilm regulatory system.
- Read-back mapping to the paired-end-aware assembly achieved **99.15% overall alignment** and **99.97% reference breadth**.

## Project overview
This project examines antimicrobial resistance (AMR), biofilm-associated factors and virulence genes in *A. baumannii* using public Illumina whole-genome sequencing data. Analyses were conducted using Ubuntu/Linux command-line tools, with Galaxy used for workflow cross-checking.

**Dataset:** NCBI SRA [SRR41175570](https://www.ncbi.nlm.nih.gov/sra/SRR41175570)  
**Experiment:** SRX35685228 | **BioProject:** PRJNA1004324  
**Data:** 496,637 paired-end read pairs. Observed read length was variable, **35–151 bp** (examples: 132 and 151 bp).

## Workflow comparison
The same paired-end dataset was assembled using two approaches:

1. **Unpaired-read workflow:** the interleaved FASTQ file was supplied to SPAdes using `-s` with `--careful`.
2. **Paired-end-aware workflow:** verified R1 and R2 files were supplied using `-1` and `-2` with `--isolate`.

The split-read integrity check confirmed that all **496,637 read pairs** matched the original interleaved FASTQ records.

| QUAST metric | Unpaired-read | Paired-end-aware |
|---|---:|---:|
| Contigs (≥500 bp) | 102 | 92 |
| Total length | 3,924,119 bp | 3,927,009 bp |
| Largest contig | 340,259 bp | 308,988 bp |
| N50 | 105,017 bp | 113,506 bp |
| N90 | 19,614 bp | 24,874 bp |
| GC content | 38.93% | 38.93% |

The paired-end-aware assembly showed improved contiguity by several QUAST metrics, although its largest contig was smaller. SPAdes modes also differed, so the comparison does not isolate read-pair information as the only variable.

## AMR and virulence findings
AMRFinderPlus identified the same 21 unique gene symbols/elements in both assemblies. Selected findings included *bla*<sub>OXA-23</sub>, *bla*<sub>OXA-66</sub>, *bla*<sub>ADC-223</sub>, *armA*, *sul1* and *tet(B)*. The output also included other categories, such as *nreB*, so the total should not be interpreted as 21 clinical AMR determinants.

VFDB analysis detected 119 hits (118 unique gene names) in each assembly. Biofilm-category hits included:
- Quorum sensing: *abaI, abaR*
- AdeFGH efflux system: *adeF, adeG, adeH*
- PNAG-associated cluster: *pgaA, pgaB, pgaC, pgaD*
- Biofilm regulation: *bfmR, bfmS*

Additional virulence-associated groups included type IV pili/adherence, capsule, lipopolysaccharide, iron acquisition, and type II/type VI secretion systems.

Pasteur MLST assigned the paired-end-aware assembly to **ST2**.

## Read mapping and annotation
Bowtie2 mapping of the original paired reads against the paired-end-aware assembly gave **99.15% overall alignment**, **99.97% reference breadth** and a length-weighted mean depth of **36.51×**. This is read-back mapping using the same dataset, not independent validation.

Prokka annotated 3,728 CDS, 7 rRNA, 69 tRNA and 1 tmRNA in the paired-end-aware assembly.

## Tools
FastQC 0.12.1 | SPAdes 3.15.5 | QUAST 5.3.0 | Prokka 1.15.6 | AMRFinderPlus 4.2.7 (database 2026-10-29.1) | ABRicate 1.4.0 (VFDB) | MLST 2.35.0 | Bowtie2 2.5.4 | SAMtools 1.22.1 | Galaxy | Ubuntu/Linux

## Limitations
This is a single-genome computational analysis. Gene detection indicates sequence similarity or genomic potential, not gene expression, functional activity, antimicrobial susceptibility or experimentally confirmed biofilm formation. The two assemblies are alternative analyses of the same dataset, not independent biological replicates. Assembly differences may reflect both read handling and the different SPAdes modes used.


