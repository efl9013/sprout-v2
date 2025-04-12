#!/bin/bash

set -u

if [ $# -ne 1 ]; then
  echo "Usage: $0 <number_of_iterations>"
  exit 1
fi

# Define the number of iterations
n=$1

# Define the output file and aggregation file 
output_file="sprout_output.txt"
aggregation_file="sprout_output_aggregation.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"
> "$aggregation_file"

# Base directory where the files are located
base_dir="../examples/sprout"

# List of examples to verify
files=(
  "calculator"
  "fibonacci"
  "higher-lower"
  "http"
  "negotiation"
  "online-wallet"
  "sh"
  "ticket"
  "travel-agency"
  "two-buyer"
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
  "fwd-auth-no"
  "symbolic-two-bidder-no2"
  "higher-lower-ultimate"
  "higher-lower-winning"
  "higher-lower-no"
  "higher-lower-encrypt-yes"
  "higher-lower-encrypt-no"
  "higher-lower-mixed"
)

# Removing generated files before the experiment 
sh cleanup.sh

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
  # Run the command n times and append output to the file
  for ((i=1; i<=n; i++)); do
    # Cleanup generated files before each iteration
    sh cleanup.sh 

    # Capture output and process line-by-line
    ./_build/default/main.exe "$full_path" 40 opt parallel 2>&1 | while IFS= read -r line; do
      # Write to output file
      echo "$line" >> "$output_file"
      
      # Check for verification time line
      if [[ "$line" == "Total verification time:"* ]]; then
        # Extract time using parameter expansion (works on all systems)
        time="${line#*Total verification time:}"
        echo "$file iteration $i: ${time}"
        echo "$file iteration $i: ${time}" >> "$aggregation_file"
      fi
    done 
    
    
    echo "----" >> "$output_file"  # Separator between iterations
  done

  echo -e "\n\n" >> "$output_file"
  echo "$file verified."
done

# Removing generated files after the experiment 
sh cleanup.sh 

echo "All examples verified $n times; results saved in $output_file."
