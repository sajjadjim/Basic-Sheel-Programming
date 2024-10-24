#!/bin/bash 

# Main script to print pyramid pattern
read -p "Enter the number of rows N: " N

for ((i = 1; i <= N; i++)); do
    # Print spaces
    for ((j = i; j < N; j++)); do
        echo -n " "
    done
    # Print stars
    for ((k = 1; k <= (2 * i - 1); k++)); do
        echo -n "*"
    done
    echo ""
done
