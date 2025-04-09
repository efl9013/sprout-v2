#!/bin/bash

set -u

# Define the output file
output_file="sprout_output.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"

# Base directory where the files are located
base_dir="../examples/sprout"

# List of examples to verify
files=(
  "calculator"
  "fibonacci"
  "higher-lower-original"
  "http"
  "negotiation"
  "online-wallet"
  "sh"
  "ticket"
  "travel-agency"
  "two-buyer"
  "adder"
  "double-buffering"
  "oauth"
  "plus-minus"
  "ring-max"
  "simple-adder"
  "simple-auth"
  "travel-agency2"
  # 
  "send-validity-yes"
  "send-validity-no"
  "receive-validity-yes"
  "receive-validity-no"
  "symbolic-two-bidder-yes"
  "symbolic-two-bidder-no1"
  "figure12-yes"
  "figure12-no"
  "symbolic-send-validity-yes"
  "symbolic-send-validity-no"
  "symbolic-receive-validity-yes"
  "symbolic-receive-validity-no"
  "fwd-auth-yes"
  # "fwd-auth-no"
  "symbolic-two-bidder-no2"
  "higher-lower-ultimate"
  # "higher-lower-winning"
  "higher-lower-no"
  "higher-lower-encrypt-yes"
  "higher-lower-encrypt-no"
  "higher-lower-mixed"
)

# Removing generated files before the experiment 
(cd "$base_dir" && sh cleanup.sh)

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
  echo "Processing $file" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  # Run the command and append output to the file
  dune exec sprout "$full_path" 30 opt parallel >> "$output_file"

  # Add a separator after each file's output
  echo -e "\n\n" >> "$output_file"

  echo "$file verified."
done

# Removing generated files after the experiment 
(cd "$base_dir" && sh cleanup.sh)

echo "All examples verified; results saved in $output_file."
