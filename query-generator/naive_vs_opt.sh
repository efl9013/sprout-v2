#!/bin/bash

set -u

# Define the output file
output_file="naive_vs_opt_output.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"

# Base directory where the files are located
base_dir="../literature-examples/all_examples"

# List of examples to verify
files=(
  "figure12-yes"
  "figure12-no"
  "two-buyer"
  "higher-lower-ultimate"
  "higher-lower-no"
  "symbolic-two-bidder-yes"
  "symbolic-two-bidder-no1"
)

# Iterate over the files
for file in "${files[@]}"; do
  # Construct the full path to the file
  full_path="$base_dir/$file"

  # Check if file exists
  if [ ! -f "$full_path" ]; then
    echo "Warning: File $full_path not found. Skipping." >> "$output_file"
    continue
  fi

  # Add a header for each file in the output
  echo "Processing $file on naive mode" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  # Run one command for naive version and append output to the file
  dune exec query-generator "$full_path" 300 naive parallel >> "$output_file"

  # Add a separator after each file's output
  echo -e "\n\n" >> "$output_file"

  echo "$file verified."

  echo "Processing $file on optimized mode" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  # Run one command for optimized version and append output to the file
  dune exec query-generator "$full_path" 30 opt parallel >> "$output_file"

  # Add a separator after each file's output
  echo -e "\n\n" >> "$output_file"

  echo "$file verified."

done

echo "All examples verified; results saved in $output_file."
