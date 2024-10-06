#!/bin/bash

# Main script to calculate the summation of numbers from 1 to N
read -p "Enter a number N: " N
sum=0

for ((i = 1; i <= N; i++)); do
    sum=$((sum + i))
done

echo "The summation of numbers from 1 to $N is: $sum"
