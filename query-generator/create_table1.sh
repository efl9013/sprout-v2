#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <sprout_output> <table_file>"
    exit 1
fi

file1="$1"          
output_file="$2"     
template_file="table1_empty.txt"   

# Validate input file existence
if [[ ! -f "$file1" ]]; then
    echo "Error: Input file '$file1' not found" >&2
    exit 1
fi

# Clear the output file if it exists, or create a new one
> "$output_file"

# Copy Table 1's template to the final table 
cp "$template_file" "$output_file"

# Examples from Table 1
files=(
  "figure12-yes"
  "figure12-no"
  "two-buyer"
  "higher-lower-ultimate"
  "higher-lower-no"
  "symbolic-two-bidder-yes"
  "symbolic-two-bidder-no1"
)

# Initialize output file
# echo "filename,average_time,average_result" > "$output_file"

# First enter Sprout's two columns 
# Process each filename
for filename in "${files[@]}"; do
  # Normalize search pattern (remove hyphens and spaces, convert to lowercase)
  search_pattern=$(echo "$filename" | tr -d '[:space:]-' | tr '[:upper:]' '[:lower:]')

  # Initialize arrays
  times=()
  results=()
  
  # Process file1
  while IFS= read -r line || [[ -n "$line" ]]; do
    # Match lines with pattern: "filename iteration N: X.XXs, result"
    if [[ "$line" =~ ^([^[:space:]]+)\ iteration\ [0-9]+\ \(optimized\):\ +([0-9.]+)s,\ (implementable|non-implementable|inconclusive|oom)$ ]]; then 
      current=$(echo "${BASH_REMATCH[1]}" | tr -d '[:space:]-'| tr '[:upper:]' '[:lower:]')

      if [[ "$current" == "$search_pattern" ]]; then
        times+=("${BASH_REMATCH[2]}")
        results+=("${BASH_REMATCH[3]}")
      fi
    fi
    
  done < "$file1"

  # Calculate average time
  average_time="N/A"
  if ((${#times[@]} > 0)); then
    sum=$(IFS=+; echo "${times[*]}")
    average_time=$(awk -v sum="$sum" -v count="${#times[@]}" 'BEGIN { printf "%.1f", sum/count }')
  fi


  # Calculate average result 
  average_result="?"
  if [[ ${#results[@]} -gt 0 ]]; then
    # Count occurrences of each result type
    impl_count=0
    non_impl_count=0
    oom_count=0
    for result in "${results[@]}"; do
      if [[ "$result" == "implementable" ]]; then
        ((impl_count++))
      elif [[ "$result" == "non-implementable" ]]; then
        ((non_impl_count++))
      elif [[ "$result" == "oom" ]]; then
        ((oom_count++))
      fi
    done

    # Apply new decision logic
    if ((impl_count > 0 && non_impl_count == 0)); then
      average_result="Y"
    elif ((non_impl_count > 0 && impl_count == 0)); then
      average_result="N"
    elif ((oom_count > 0)); then 
      average_result="OOM"
    elif ((impl_count > 0 && non_impl_count > 0)); then
      average_result="?"
    else
      average_result="?"  
    fi
  fi
  
  echo "$filename,$average_time,$average_result" 


  # Update template file with column-aware replacement
  normalized_template=$(echo "$filename" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]-')

  awk -v name="$normalized_template" \
      -v time="$average_time" \
      -v result="$average_result" '
  BEGIN { OFS="" }
  {
      # Normalize first column for comparison
      first_col = tolower($0)
      sub(/[[:space:]]*\|.*/, "", first_col)
      gsub(/[[:space:]-]/, "", first_col)
      
      if (first_col == name) {
          # Update columns after position 47
          prefix = substr($0, 1, 38)
          suffix = substr($0, 39)
          
          # Update implementation status (8 characters centered)
          status_field = sprintf("%4s%-4s", "", result)  # Force 8 characters
          status_field = substr(status_field, 1, 8)      # Ensure exact length
          
          # Update time in 13 spaces centered
          time_str = (time == "N/A" ? "" : sprintf("%0.1fs", time))
          time_padding = int((13 - length(time_str)) / 2)
          time_field = sprintf("%*s%s%*s", time_padding, "", time_str, 13 - time_padding - length(time_str), "")
          time_field = substr(time_field, 1, 13)  # Ensure exact length
          
          # Rebuild suffix with exact spacing and separators
          new_suffix = status_field "|" time_field "|"
          
          $0 = prefix new_suffix
      }
      print
  }' "$output_file" > "${output_file}.tmp" && mv "${output_file}.tmp" "$output_file"

done

echo "Sprout (optimized) results written to $output_file."

# Second enter Sprout's naive two columns 
# Process each filename
for filename in "${files[@]}"; do
  # Normalize search pattern (remove hyphens and spaces, convert to lowercase)
  search_pattern=$(echo "$filename" | tr -d '[:space:]-' | tr '[:upper:]' '[:lower:]')

  # Initialize arrays
  times=()
  results=()
  
  # Process file2
  while IFS= read -r line || [[ -n "$line" ]]; do
    # Match lines with pattern: "filename iteration N: X.XXs, result"
    if [[ "$line" =~ ^([^[:space:]]+)\ iteration\ [0-9]+\ \(naive\):\ +([0-9.]+)s,\ (implementable|non-implementable|inconclusive|oom)$ ]]; then 
      current=$(echo "${BASH_REMATCH[1]}" | tr -d '[:space:]-'| tr '[:upper:]' '[:lower:]')

      if [[ "$current" == "$search_pattern" ]]; then
        times+=("${BASH_REMATCH[2]}")
        results+=("${BASH_REMATCH[3]}")
      fi
    fi
    
  done < "$file1"

  # Calculate average time
  average_time="N/A"
  if ((${#times[@]} > 0)); then
    sum=$(IFS=+; echo "${times[*]}")
    average_time=$(awk -v sum="$sum" -v count="${#times[@]}" 'BEGIN { printf "%.1f", sum/count }')
  fi


  # Calculate average result 
  average_result="?"
  if [[ ${#results[@]} -gt 0 ]]; then
    # Count occurrences of each result type
    impl_count=0
    non_impl_count=0
    oom_count=0
    for result in "${results[@]}"; do
      if [[ "$result" == "implementable" ]]; then
        ((impl_count++))
      elif [[ "$result" == "non-implementable" ]]; then
        ((non_impl_count++))
      elif [[ "$result" == "oom" ]]; then
        ((oom_count++))
      fi
    done

    # Apply new decision logic
    if ((impl_count > 0 && non_impl_count == 0)); then
      average_result="Y"
    elif ((non_impl_count > 0 && impl_count == 0)); then
      average_result="N"
    elif ((oom_count > 0)); then 
      average_result="OOM"
    elif ((impl_count > 0 && non_impl_count > 0)); then
      average_result="?"
    else
      average_result="?"  
    fi
  fi
  
  echo "$filename,$average_time,$average_result" 


  # Update template file with column-aware replacement
  normalized_template=$(echo "$filename" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]-')

  awk -v name="$normalized_template" \
      -v time="$average_time" \
      -v result="$average_result" '
  BEGIN { OFS="" }
  {
      # Normalize first column for comparison
      first_col = tolower($0)
      sub(/[[:space:]]*\|.*/, "", first_col)
      gsub(/[[:space:]-]/, "", first_col)
      
      if (first_col == name) {
          # Update columns after position 62
          prefix = substr($0, 1, 62)
          suffix = substr($0, 63)
          
          # Update implementation status (7 characters centered)
          status_field = sprintf("%3s%-4s", "", result)  # Force 7 characters
          status_field = substr(status_field, 1, 7)      # Ensure exact length
          
          # Update time in 13 spaces centered
          time_str = (time == "N/A" ? "" : sprintf("%0.1fs", time))
          time_padding = int((13 - length(time_str)) / 2)
          time_field = sprintf("%*s%s%*s", time_padding, "", time_str, 13 - time_padding - length(time_str), "")
          time_field = substr(time_field, 1, 13)  # Ensure exact length
          
          # Rebuild suffix with exact spacing and separators
          new_suffix = status_field "|" time_field "|"
          
          $0 = prefix new_suffix
      }
      print
  }' "$output_file" > "${output_file}.tmp" && mv "${output_file}.tmp" "$output_file"

done

echo "Sprout (naive) results written to $output_file."

# Display Table 2 
eval cat "$output_file"

