#!/bin/bash

set -u

# Define the output file
output_file="rumpsteak_output.txt"

# Clear the output file if it exists, or create a new one
> "$output_file"

# List of commands to execute
commands=(
  "/tmp/scr2dot-main/_build/default/scr2dot.exe Calculator.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe Http.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  # "/tmp/scr2dot-main/_build/default/scr2dot.exe SH.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe TwoBuyer.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe DoubleBuffering.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe OAuth.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe PlusMinus.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe RingMax.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SimpleAuth.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe TravelAgency2.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe Figure12.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe Figure12No.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SendValidityYes.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SendValidityNo.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SymbolicSendValidityYes.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SymbolicSendValidityNo.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe ReceiveValidityYes.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe ReceiveValidityNo.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SymbolicReceiveValidityYes.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
  "/tmp/scr2dot-main/_build/default/scr2dot.exe SymbolicReceiveValidityNo.nuscr | /tmp/mpst_unroll-main/target/debug/mpst_unroll | /tmp/dynamic_verify-main/target/debug/parser"
)

# Iterate over the commands
for cmd in "${commands[@]}"; do
  # Add a header for each command in the output
  echo "Executing: $cmd" >> "$output_file"
  echo "----------------------------------------" >> "$output_file"
  
  # Run the command and append output to the file
  eval "time (timeout 5 $cmd)" >> "$output_file" 2>&1
  
  # Add a separator after each command's output
  echo -e "\n\n" >> "$output_file"
  
  echo "$cmd executed"
done

echo "All commands executed; results saved in $output_file"
