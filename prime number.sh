#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ "$num" -le 1 ]; then
        echo 0
        return
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo 0
            return
        fi
    done
    echo 1
}

# Main script to sum prime numbers
read -p "Enter a number N: " N
sum=0

for ((i = 2; i <= N; i++)); do
    if [ $(is_prime $i) -eq 1 ]; then
        sum=$((sum + i))
    fi
done

echo "The sum of prime numbers between 1 and $N is: $sum"
