#!/bin/bash

echo "Script started."

# Define directories (replace with your actual paths)
workdir="/path/to/your/working/directory"
scrnadir="/path/to/your/scrna/fastq/directory"
crisprdir="/path/to/your/sccrispr/fastq/directory"

echo "Working directory: $workdir"
echo "scRNA directory: $scrnadir"
echo "scCRISPR directory: $crisprdir"

# Ensure that the workdir exists
mkdir -p $workdir
cd $workdir

echo "Changed to Working directory: $(pwd)"

# Create symbolic links and rename them for scRNA files
echo "Creating and renaming symbolic links for scRNA files..."

counter=1
for file in $scrnadir/*R1.fastq.gz; do
  ln -s "$file" "$(basename "$file")"
  new_name=$(printf "GEX_RA%d_S%d_L001_R1_001.fastq.gz" "$counter" "$counter")
  mv "$(basename "$file")" "$new_name"
  counter=$((counter + 1))
done

counter=1
for file in $scrnadir/*R2.fastq.gz; do
  ln -s "$file" "$(basename "$file")"
  new_name=$(printf "GEX_RA%d_S%d_L001_R2_001.fastq.gz" "$counter" "$counter")
  mv "$(basename "$file")" "$new_name"
  counter=$((counter + 1))
done

echo "scRNA symbolic links are created."

# Create symbolic links and rename them for CRISPR files
echo "Creating and renaming symbolic links for CRISPR files..."

counter=1
for file in $crisprdir/*R1.fastq.gz; do
  ln -s "$file" "$(basename "$file")"
  new_name=$(printf "CRISPR_RA%d_S%d_L001_R1_001.fastq.gz" "$counter" "$counter")
  mv "$(basename "$file")" "$new_name"
  counter=$((counter + 1))
done

counter=1
for file in $crisprdir/*R2.fastq.gz; do
  ln -s "$file" "$(basename "$file")"
  new_name=$(printf "CRISPR_RA%d_S%d_L001_R2_001.fastq.gz" "$counter" "$counter")
  mv "$(basename "$file")" "$new_name"
  counter=$((counter + 1))
done

echo "CRISPR symbolic links are created."

echo "All symbolic links have been created and renamed successfully!"