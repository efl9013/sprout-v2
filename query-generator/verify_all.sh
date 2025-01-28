#!/bin/bash

# Set error handling
set -e
set -u

# Define the output file
output_file="output.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"

# List of specific files in different directories
files=(
  "examples/calculator/calculator-yes"
  "examples/fwd-auth/fwd-auth-yes" 
  "examples/load-balancer"
  "examples/onlinewallet"
  "examples/pingpong"
  "examples/receive-validity/receive-validity-yes"
  "examples/receive-validity/receive-validity-no"
  "examples/send-validity/send-validity-yes"
  "examples/send-validity/send-validity-no"
  "examples/symbolic-two-bidder/symbolic-two-bidder-yes"
  "examples/symbolic-two-bidder/symbolic-two-bidder-no"
  "examples/three-buyer"
  "examples/travel-agency"
  "examples/two-buyer"
  # Add more files as needed
)

# Add all examples from examples/binary-examples directory
files+=(examples/binary-examples/*)

# Iterate over the files
for file in "${files[@]}"; do
  # Check if file exists
  if [ ! -f "$file" ]; then
    echo "Warning: File $file not found. Skipping." >> "$output_file"
    continue
  fi

  # Extract the filename without path
  filename=$(basename "$file")
  
  # Add a header for each file in the output
  echo "Processing $file" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  
  # Run the command and append output to the file
  sh cleanup.sh
  dune exec query-generator "$file" 5 v3bb parallel >> "$output_file"
  
  # Add a separator after each file's output
  echo -e "\n\n" >> "$output_file"
  
  echo "$file verified"
done

echo "All examples verified; results saved in $output_file"
