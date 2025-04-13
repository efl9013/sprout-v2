#!/bin/bash

set -u

if [ $# -ne 1 ]; then
  echo "Usage: $0 <number_of_iterations>"
  exit 1
fi

# Define the number of iterations
n=$1

# Define the output file
output_file="sessionstar_output.txt"
aggregation_file="sessionstar_output_aggregation.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"
> "$aggregation_file"

# List of commands to execute
commands=(
  "sessionstar Calculator.scr Calc S; sessionstar Calculator.scr Calc C"
  "sessionstar Fibonacci.scr Fib A; sessionstar Fibonacci.scr Fib B"
  "sessionstar HigherLower.scr HigherLower A; sessionstar HigherLower.scr HigherLower B; sessionstar HigherLower.scr HigherLower C"
  "sessionstar Http.scr Http S; sessionstar Http.scr Http C"
  "sessionstar Negotiation.scr Negotiate C; sessionstar Negotiation.scr Negotiate P"
  "sessionstar OnlineWallet.scr OnlineWallet A; sessionstar OnlineWallet.scr OnlineWallet C; sessionstar OnlineWallet.scr OnlineWallet S"
  "sessionstar SH.scr SH C; sessionstar SH.scr SH P; sessionstar SH.scr SH R"
  "sessionstar Ticket.scr Ticket C; sessionstar Ticket.scr Ticket S"
  "sessionstar TravelAgency.scr Booking A; sessionstar TravelAgency.scr Booking C; sessionstar TravelAgency.scr Booking S"
  "sessionstar TwoBuyer.scr TwoBuyer A; sessionstar TwoBuyer.scr TwoBuyer B; sessionstar TwoBuyer.scr TwoBuyer S"
  "sessionstar DoubleBuffering.scr DoubleBuffering S; sessionstar DoubleBuffering.scr DoubleBuffering K; sessionstar DoubleBuffering.scr DoubleBuffering T"
  "sessionstar OAuth.scr OAuth A; sessionstar OAuth.scr OAuth C; sessionstar OAuth.scr OAuth S"
  "sessionstar PlusMinus.scr PlusMinus A; sessionstar PlusMinus.scr PlusMinus B; sessionstar PlusMinus.scr PlusMinus C"
  "sessionstar RingMax.scr RingMax A; sessionstar RingMax.scr RingMax B; sessionstar RingMax.scr RingMax C; sessionstar RingMax.scr RingMax D; sessionstar RingMax.scr RingMax E"
  "sessionstar SimpleAuth.scr SimpleAuth C; sessionstar SimpleAuth.scr SimpleAuth S"
  "sessionstar TravelAgency2.scr TravelAgency2 A; sessionstar TravelAgency2.scr TravelAgency2 C"
  #
  "sessionstar SendValidityYes.scr SendValidityYes P; sessionstar SendValidityYes.scr SendValidityYes Q; sessionstar SendValidityYes.scr SendValidityYes R"
  "sessionstar SendValidityNo.scr SendValidityNo P; sessionstar SendValidityNo.scr SendValidityNo Q; sessionstar SendValidityNo.scr SendValidityNo R"
  "sessionstar ReceiveValidityYes.scr ReceiveValidityYes P; sessionstar ReceiveValidityYes.scr ReceiveValidityYes Q; sessionstar ReceiveValidityYes.scr ReceiveValidityYes R" 
  "sessionstar ReceiveValidityNo.scr ReceiveValidityNo P; sessionstar ReceiveValidityNo.scr ReceiveValidityNo Q; sessionstar ReceiveValidityNo.scr ReceiveValidityNo R" 
  "sessionstar SymbolicTwoBidderYes.scr SymbolicTwoBidderYes S; sessionstar SymbolicTwoBidderYes.scr SymbolicTwoBidderYes B1; sessionstar SymbolicTwoBidderYes.scr SymbolicTwoBidderYes B2"
  "sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 S; sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 B1; sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 B2"
  "sessionstar Figure12Yes.scr Figure12Yes P; sessionstar Figure12Yes.scr Figure12Yes Q; sessionstar Figure12Yes.scr Figure12Yes R"
  "sessionstar Figure12No.scr Figure12No P; sessionstar Figure12No.scr Figure12No Q; sessionstar Figure12No.scr Figure12No R"
  "sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes P; sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes Q; sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes R"
  "sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo P; sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo Q; sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo R"
  "sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes P; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes Q; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes R; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes S" 
  "sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo P; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo Q; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo R; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo S" 
  "sessionstar FwdAuthYes.scr FwdAuthYes S; sessionstar FwdAuthYes.scr FwdAuthYes A; sessionstar FwdAuthYes.scr FwdAuthYes C"
  "sessionstar FwdAuthNo.scr FwdAuthNo S; sessionstar FwdAuthNo.scr FwdAuthNo A; sessionstar FwdAuthNo.scr FwdAuthNo C"
  "sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 S; sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 B1; sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 B2"
  "sessionstar HigherLowerUltimate.scr HigherLowerUltimate A; sessionstar HigherLowerUltimate.scr HigherLowerUltimate B; sessionstar HigherLowerUltimate.scr HigherLowerUltimate C"
  "sessionstar HigherLowerWinning.scr HigherLowerWinning A; sessionstar HigherLowerWinning.scr HigherLowerWinning B; sessionstar HigherLowerWinning.scr HigherLowerWinning C"
  "sessionstar HigherLowerNo.scr HigherLowerNo A; sessionstar HigherLowerNo.scr HigherLowerNo B; sessionstar HigherLowerNo.scr HigherLowerNo C"
  "sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes A; sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes B; sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes C"
  "sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo A; sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo B; sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo C"
  "sessionstar HigherLowerMixed.scr HigherLowerMixed A; sessionstar HigherLowerMixed.scr HigherLowerMixed B; sessionstar HigherLowerMixed.scr HigherLowerMixed C"
  )

# Removing generated files before the experiment 
sh cleanup.sh

# Iterate over the commands
for cmd in "${commands[@]}"; do
  # Extract example filename 
  file=$(echo "$cmd" | grep -oP 'sessionstar \K[^ ]+\.scr' | sed 's/\.scr//' | sort -u)

  # Add a header for each file in the output
  echo "Processing: $file" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"


  # Run the command n times and append output to the file

  for ((i=1; i<=n; i++)); do
    sh cleanup.sh 
    time=""
    res="implementable"  

    # Use process substitution to avoid subshell issues
    while IFS= read -r line; do
      echo "$line" >> "$output_file"
      
      # Parse timing (strict regex match for "real <number>")
      if [[ "$line" =~ ^real[[:space:]]+([0-9.]+)$ ]]; then
        time="${BASH_REMATCH[1]}"
      fi
      
      # Parse results 
      if [[ "$line" == *"Scribble reported a problem, aborting"* ]]; then
        res="non-implementable"
      elif [[ "$line" =~ ("Unknown variable"|"Cannot parse") ]]; then
        res="inconclusive"
      #elif [[ "$line" == *"Scribble reported a problem, aborting"* ]]; then
      # res="non-implementable"
      elif [[ "$line" == *"EXITCODE:124"* ]]; then 
        res="inconclusive"
      fi
    done < <({ time -p timeout 300s bash -c "$cmd"; } 2>&1; echo "EXITCODE:$?") # Storing exit code 
    
    # Write results 
    echo "$file iteration $i: ${time}s, ${res}"
    echo "$file iteration $i: ${time}s, ${res}" >> "$aggregation_file"
    echo "----" >> "$output_file"
  
  done
  
  echo -e "\n\n" >> "$output_file"
  echo "$file verified."
done

# Removing generated files after the experiment 
sh cleanup.sh 

echo "All examples verified $n times; results saved in $output_file."
