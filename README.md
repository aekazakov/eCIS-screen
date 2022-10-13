# Readme for eCIS-screen
This repository contains the code used for screening putative extracellular Contractile Injection System (eCIS) loci from genomic sequences.

## Note
This pipeline was designed and tested on Linux system only, though it may also work on other platforms with the required Perl environment.

## Requirements
All scripts of this pipeline were custom wrtten in `Perl` (5.10.1) with `bioperl` (1.7).
Additional program required is `HMMER` (3.1b2) available from http://hmmer.org/download.html.

## Install
Run setup.sh script to create a separate conda environment for the tool.

The script `HMMsearch_genomesII.pl` is the master of the pipeline.
After update the settings you may test the pipeline using the following command (run within the install directory):

    $ ./HMMsearch_genomesII.pl eCIS.hmm example_genomes screen_summary.txt

## Usage
The basic usage looks like the following:

    $ HMMsearch_genomesII.pl <query HMM profile> <path to genomes for screen> <output summary file>

- The `eCIS.hmm` file included is a pre-build HMM profile contains multiple HMMs for all components of eCISs.
- The path to genomes is expected to contain sub-directories for each genome, which should contain the GenBank format file named as `*_genomic.gbff.gz`. An example of the genome directory is given as `example_genomes`, which includes two genomes.
- The pipeline will produce intermdiate files (e.g. CDS proteins, HMMER output) in the CURRENT working directory (where you run the script), these files can be helpful to improve the speed of the pipeline for further runs.
- The pipeline may run for a few hours or days depends on the number of genomes for screening. The progress message will be printed to the screen by default.
- The output is in Tab-delimited text format, view in in Excel for easy read.
