#!/usr/bin/env bash

# Define filenames
file1="sprout_output_aggregation.txt"
template_file="table2_empty.txt"
output_file="table2_final.txt"

# Copy Table 2's template to the final table 
cp "$template_file" "$output_file"

# Initialize arrays
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

# Initialize output file
# echo "filename,average_time,average_result" > "$output_file"

# Process each filename
for filename in "${files[@]}"; do
  # Normalize search pattern (remove hyphens and spaces)
  search_pattern=$(echo "$filename" | tr -d '[:space:]-')
  
  # Initialize arrays
  times=()
  results=()
  
  # Process file1
  while IFS= read -r line; do
    # Match lines with pattern: "filename iteration N: X.XXs, result"
    if [[ "$line" =~ ^([^[:space:]]+)\ iteration\ [0-9]+:\ +([0-9.]+)s,\ (implementable|non-implementable|inconclusive)$ ]]; then
      # Normalize current filename from line
      current=$(echo "${BASH_REMATCH[1]}" | tr -d '[:space:]-')
      
      if [[ "$current" == "$search_pattern" ]]; then
        times+=("${BASH_REMATCH[2]}")
        results+=("${BASH_REMATCH[3]}")
      fi
    fi
  done < "$file1"

  # Calculate average time
  average_time="N/A"
  if [[ ${#times[@]} -gt 0 ]]; then
    sum=0
    count=${#times[@]}
    for t in "${times[@]}"; do
      sum=$(awk "BEGIN {printf \"%f\", $sum + $t}")
    done
    average_time=$(awk "BEGIN {printf \"%.1f\", $sum/$count}")
  fi

  # Determine result aggregation
  average_result="?"
  if [[ ${#results[@]} -gt 0 ]]; then
    unique_results=$(printf "%s\n" "${results[@]}" | sort -u)
    
    if [[ "$unique_results" == "implementable" ]]; then
      average_result="Y"
    elif [[ "$unique_results" == "non-implementable" ]]; then
      average_result="N"
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
          prefix = substr($0, 1, 47)
          suffix = substr($0, 48)
          
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

echo "Column-aware table written to $output_file"
