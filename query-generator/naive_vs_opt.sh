#!/bin/bash

set -u

# Define the output file
output_file="naive_vs_opt_output.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"

# Base directory where the files are located
base_dir="../examples/sprout"

# List of examples to verify
files=(
  # "figure12-yes"
  # "figure12-no"
  # "two-buyer"
  "higher-lower-ultimate" # timeout 300s 
  "higher-lower-no" # needs fixing so we won't test this for now 
  "symbolic-two-bidder-yes" # 22s, implementable vs timeout 923s, inconclusive 
  "symbolic-two-bidder-no1" # 20s, non-implementable vs timeout 733s, inconclusive 
)

run_with_limits() {
  local cmd=("$@")
  local mem_limit_gb=4
  local status
  
  "${cmd[@]}" >> "$output_file" 2>&1 &
  local pid=$!
  
  while kill -0 "$pid" 2>/dev/null; do
    # Sum up all processes called "main.exe"
    mem=$(ps aux | grep "[m]ain.exe" | awk '{sum += $6} END {printf "%.2f", sum / 1024 / 1024}') 

    echo "Memory used by processes main.exe: ${mem}GB"
        
    if (( $(echo "$mem > $mem_limit_gb" | bc -l) )); then
      echo "Out of memory (${mem_limit_gb}GB)" >> "$output_file"
      pkill -TERM -P "$pid"
      sleep 1
      pkill -KILL -P "$pid"
      return 137
    fi
    sleep 0.5
  done
  
  wait "$pid"
  status=$?
  return $status
}



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

  # Naive mode execution with monitoring
  echo "Processing $file on naive mode" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  run_with_limits ./_build/default/main.exe "$full_path" 300 naive parallel
  echo -e "\n\n" >> "$output_file"
  echo "$file verified (naive)."
  (cd "$base_dir" && sh cleanup.sh)

  # Optimized mode execution 
  echo "Processing $file on optimized mode" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  ./_build/default/main.exe "$full_path" 30 opt parallel >> "$output_file" 2>&1
  echo -e "\n\n" >> "$output_file"
  echo "$file verified (optimized)."
  (cd "$base_dir" && sh cleanup.sh)
done

# Removing generated files after the experiment 
(cd "$base_dir" && sh cleanup.sh)

echo "All examples verified; results saved in $output_file."
