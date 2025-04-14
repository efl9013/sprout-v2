#!/bin/bash

set -u

if [ $# -ne 1 ]; then
  echo "Usage: $0 <number_of_iterations>"
  exit 1
fi

# Define the number of iterations
n=$1

# Define the output file and aggregation file 
output_file="../examples/sprout/sprout_output_tuned.txt"
aggregation_file="../examples/sprout/sprout_output_tuned_aggregation.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"
> "$aggregation_file"

# Base directory where the files are located
base_dir="../examples/sprout"

# List of commands to execute, tuned to each example 
commands=(
  "./_build/default/main.exe "$base_dir/calculator" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/fibonacci" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/http" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/negotiation" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/online-wallet" 30 opt parallel" 
  # "./_build/default/main.exe "$base_dir/sh" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/ticket" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/travel-agency" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/two-buyer" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/double-buffering" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/oauth" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/plus-minus" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/ring-max" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/simple-auth" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/travel-agency2" 30 opt parallel" 
  # 
  "./_build/default/main.exe "$base_dir/send-validity-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/send-validity-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/receive-validity-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/receive-validity-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-two-bidder-yes" 30 espresso parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-two-bidder-no1" 30 espresso parallel" 
  "./_build/default/main.exe "$base_dir/figure12-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/figure12-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-send-validity-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-send-validity-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-receive-validity-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/symbolic-receive-validity-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/fwd-auth-yes" 30 opt parallel" 
  # "./_build/default/main.exe "$base_dir/fwd-auth-no"
  "./_build/default/main.exe "$base_dir/symbolic-two-bidder-no2" 30 espresso parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower-ultimate" 30 opt parallel" 
  # "./_build/default/main.exe "$base_dir/higher-lower-winning" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower-encrypt-yes" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower-encrypt-no" 30 opt parallel" 
  "./_build/default/main.exe "$base_dir/higher-lower-mixed" 30 opt parallel" 
)

# Removing generated files before the experiment 
sh cleanup.sh

# Iterate over the commands 
for cmd in "${commands[@]}"; do
  # Extract example filename 
  file=$(basename "$(echo "$cmd" | awk '{print $2}' | tr -d '"')")

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
    
    # Important that this is outside of the loop!
    res="" # Initialize res to empty 
    time=""
    # Capture output line-by-line
    while IFS= read -r line; do
      # Write to output file
      echo "$line" >> "$output_file"
      
      # Only if Killed is present, set res to "Killed"
      if [[ "$line" == "Killed"* ]]; then
        res="oom"
        continue
      fi 

      # Check for verification time line
      if [[ "$line" == "Total verification time:"* ]]; then
        # Extract time using parameter expansion (works on all systems)
        time="${line#*Total verification time:}"
        time="${time%%,*}"
        # Only modify res if it hasn't already been set to Killed 
        if [[ "$res" != "oom" ]]; then
          res="${line##*, }" 
        fi 
      fi
    done < <(./_build/default/main.exe "$full_path" 40 opt parallel 2>&1)
    
    echo "$file iteration $i: ${time}, ${res}"
    echo "$file iteration $i: ${time}, ${res}" >> "$aggregation_file"
    echo "----" >> "$output_file"  # Separator between iterations
  done

  echo -e "\n\n" >> "$output_file"
  echo "$file verified."
done

# Removing generated files after the experiment 
sh cleanup.sh 

echo "All examples verified $n times; results saved in $output_file."