#!/bin/bash
# Simple Interest Calculator
# Formula: SI = (P * R * T) / 100

read -p "Enter principal amount: " principal
read -p "Enter rate of interest (% per annum): " rate
read -p "Enter time period (years): " time

# Validate: non-negative numbers only
num_re='^[0-9]+([.][0-9]+)?$'
for v in "$principal" "$rate" "$time"; do
  if ! [[ $v =~ $num_re ]]; then
    echo "Error: please enter valid non-negative numbers." >&2
    exit 1
  fi
done

si=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $si" | bc)

echo "-----------------------------"
echo "Simple Interest : $si"
echo "Total Amount    : $total"
