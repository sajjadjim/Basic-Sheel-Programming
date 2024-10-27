#!/bin/bash

# Display menu
echo "Welcome to the Shell Script Program!"
echo "Please select an option:"
echo "1. Display current date and time"
echo "2. Display disk space usage"
echo "3. List files in the current directory"
echo "4. Exit"

# Read user input
read -p "Enter your choice (1-4): " choice

# Execute based on choice
case $choice in
    1)
        echo "Current Date and Time:"
        date
        ;;
    2)
        echo "Disk Space Usage:"
        df -h
        ;;
    3)
        echo "Files in the Current Directory:"
        ls
        ;;
    4)
        echo "Exiting the program. Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice, please select a valid option."
        ;;
esac
