#!/bin/bash

# Simple File Backup System

# Default backup directory
BACKUP_DIR="$HOME/backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Function to back up a file
backup_file() {
    read -p "Enter the file to back up: " file
    if [[ -f "$file" ]]; then
        cp "$file" "$BACKUP_DIR/$(basename "$file").bak"
        echo "Backup of '$file' created in '$BACKUP_DIR'."
    else
        echo "File '$file' does not exist."
    fi
}

# Function to list all backups
list_backups() {
    echo "Existing backups in '$BACKUP_DIR':"
    ls "$BACKUP_DIR"
}

# Function to restore a file from backup
restore_file() {
    read -p "Enter the name of the backup file to restore: " backup_file
    if [[ -f "$BACKUP_DIR/$backup_file" ]]; then
        cp "$BACKUP_DIR/$backup_file" .
        echo "Backup '$backup_file' restored to current directory."
    else
        echo "Backup file '$backup_file' does not exist."
    fi
}

# Function to clear all backups
clear_backups() {
    rm -f "$BACKUP_DIR"/*
    echo "All backups cleared."
}

# Main menu function
menu() {
    while true; do
        echo "======================="
        echo "   File Backup System"
        echo "======================="
        echo "1. Back Up a File"
        echo "2. List Backups"
        echo "3. Restore a File"
        echo "4. Clear All Backups"
        echo "5. Exit"
        read -p "Choose an option: " option

        case $option in
            1) backup_file ;;
            2) list_backups ;;
            3) restore_file ;;
            4) clear_backups ;;
            5) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Start the script
menu
