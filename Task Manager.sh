#!/bin/bash

# Task Manager Script

# Array to hold tasks
declare -a tasks
task_count=0

# Function to add a task
add_task() {
    read -p "Enter task description: " task
    tasks+=("$task")
    ((task_count++))
    echo "Task added: $task"
}

# Function to list all tasks
list_tasks() {
    if [ $task_count -eq 0 ]; then
        echo "No tasks available."
        return
    fi
    echo "Tasks:"
    for (( i=0; i<task_count; i++ )); do
        echo "$((i + 1)). ${tasks[i]}"
    done
}

# Function to remove a task
remove_task() {
    list_tasks
    read -p "Enter task number to remove: " task_num
    if [[ $task_num -gt 0 && $task_num -le $task_count ]]; then
        unset 'tasks[$((task_num - 1))]'
        tasks=("${tasks[@]}") # Re-index the array
        ((task_count--))
        echo "Task $task_num removed."
    else
        echo "Invalid task number."
    fi
}

# Function to clear all tasks
clear_tasks() {
    tasks=()
    task_count=0
    echo "All tasks cleared."
}

# Main menu function
menu() {
    while true; do
        echo "======================="
        echo "      Task Manager"
        echo "======================="
        echo "1. Add Task"
        echo "2. List Tasks"
        echo "3. Remove Task"
        echo "4. Clear Tasks"
        echo "5. Exit"
        read -p "Choose an option: " option

        case $option in
            1) add_task ;;
            2) list_tasks ;;
            3) remove_task ;;
            4) clear_tasks ;;
            5) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Start the script
menu
