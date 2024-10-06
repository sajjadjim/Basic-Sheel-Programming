#!/bin/bash

# Function to calculate factorial
factorial() {
    local num=$1
    fact=1
    for ((i = 2; i <= num; i++)); do
        fact=$((fact * i))
    done
    echo $fact
}

# Main script
read -p "Enter a number N: " N
result=$(factorial $N)
echo "The factorial of $N is: $result"
