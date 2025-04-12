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
  "sessionstar Calc.scr Calc S; sessionstar Calc.scr Calc C"
  "sessionstar Fib.scr Fib A; sessionstar Fib.scr Fib B"
  "sessionstar HigherLower.scr HigherLower A; sessionstar HigherLower.scr HigherLower B; sessionstar HigherLower.scr HigherLower C"
  "sessionstar Http.scr Http S; sessionstar Http.scr Http C"
  "sessionstar Nego.scr Negotiate C; sessionstar Nego.scr Negotiate P"
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
  "sessionstar HigherLowerUltimate.scr HigherLowerUltimate A; sessionstar HigherLowerUltimate.scr HigherLowerUltimate B; sessionstar HigherLowerUltimate.scr HigherLowerUltimate C"
  # "sessionstar HigherLowerWinning.scr HigherLowerWinning A; sessionstar HigherLowerWinning.scr HigherLowerWinning B; sessionstar HigherLowerWinning.scr HigherLowerWinning C"
  "sessionstar HigherLowerNo.scr HigherLowerNo A; sessionstar HigherLowerNo.scr HigherLowerNo B; sessionstar HigherLowerNo.scr HigherLowerNo C"
  "sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes A; sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes B; sessionstar HigherLowerEncryptYes.scr HigherLowerEncryptYes C"
  "sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo A; sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo B; sessionstar HigherLowerEncryptNo.scr HigherLowerEncryptNo C"
  "sessionstar HigherLowerMixed.scr HigherLowerMixed A; sessionstar HigherLowerMixed.scr HigherLowerMixed B; sessionstar HigherLowerMixed.scr HigherLowerMixed C"
  "sessionstar SymbolicTwoBidder.scr SymbolicTwoBidder S; sessionstar SymbolicTwoBidder.scr SymbolicTwoBidder B1; sessionstar SymbolicTwoBidder.scr SymbolicTwoBidder B2"
  "sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 S; sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 B1; sessionstar SymbolicTwoBidderNo1.scr SymbolicTwoBidderNo1 B2"
  "sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 S; sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 B1; sessionstar SymbolicTwoBidderNo2.scr SymbolicTwoBidderNo2 B2"
  "sessionstar Figure12Yes.scr Figure12Yes P; sessionstar Figure12Yes.scr Figure12Yes Q; sessionstar Figure12Yes.scr Figure12Yes R"
  "sessionstar Figure12No.scr Figure12No P; sessionstar Figure12No.scr Figure12No Q; sessionstar Figure12No.scr Figure12No R"
  "sessionstar SendValidityYes.scr SendValidityYes P; sessionstar SendValidityYes.scr SendValidityYes Q; sessionstar SendValidityYes.scr SendValidityYes R"
  "sessionstar SendValidityNo.scr SendValidityNo P; sessionstar SendValidityNo.scr SendValidityNo Q; sessionstar SendValidityNo.scr SendValidityNo R"
  "sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes P; sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes Q; sessionstar SymbolicSendValidityYes.scr SymbolicSendValidityYes R"
  "sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo P; sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo Q; sessionstar SymbolicSendValidityNo.scr SymbolicSendValidityNo R"
  "sessionstar ReceiveValidityYes.scr ReceiveValidityYes P; sessionstar ReceiveValidityYes.scr ReceiveValidityYes Q; sessionstar ReceiveValidityYes.scr ReceiveValidityYes R" 
  "sessionstar ReceiveValidityNo.scr ReceiveValidityNo P; sessionstar ReceiveValidityNo.scr ReceiveValidityNo Q; sessionstar ReceiveValidityNo.scr ReceiveValidityNo R" 
  "sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes P; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes Q; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes R; sessionstar SymbolicReceiveValidityYes.scr SymbolicReceiveValidityYes S" 
  "sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo P; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo Q; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo R; sessionstar SymbolicReceiveValidityNo.scr SymbolicReceiveValidityNo S" 
  "sessionstar ForwardAuthYes.scr ForwardAuthYes S; sessionstar ForwardAuthYes.scr ForwardAuthYes A; sessionstar ForwardAuthYes.scr ForwardAuthYes C"
  "sessionstar ForwardAuthNo.scr ForwardAuthNo S; sessionstar ForwardAuthNo.scr ForwardAuthNo A; sessionstar ForwardAuthNo.scr ForwardAuthNo C"
)

# Iterate over the commands
for cmd in "${commands[@]}"; do
  # Extract example filename 
  file=$(echo "$cmd" | grep -oP 'sessionstar \K[^ ]+\.scr' | sed 's/\.scr//' | sort -u)

  echo "Executing: $cmd" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  
  for ((i=1; i<=n; i++)); do
    time=""  # Initialize time variable
    res=""   # Initialize result variable

    # Capture output and timing
    { time -p eval "$cmd"; } 2>&1 | while IFS= read -r line; do
      # Write all output to main log
      echo "$line" >> "$output_file"
      
      # Parse timing and results
      if [[ "$line" == real* ]]; then
        time=$(echo "$line" | awk '{print $2}')
      fi
      
      if [[ "$line" == *"Cannot project"* ]]; then
        res="non-implementable"
      elif [[ "$line" == *"Scribble reported a problem"* ]]; then
        res="inconclusive"
      else
        res="implementable"
      fi
    done
    
    # Write aggregated results after each iteration
    echo "$file iteration $i: ${time}, ${res}"
    echo "$file iteration $i: ${time}, ${res}" >> "$aggregation_file"
    echo "----" >> "$output_file"
  done
  
  echo -e "\n\n" >> "$output_file"
  echo "$file verified."
done

echo "All commands executed; results saved in $output_file"
