# 1. FCFS Without Arrival Time
# First-Come, First-Served (FCFS) scheduling without considering arrival time.
# Processes are executed in the order provided.

echo "Enter the number of processes:"
read n

echo "Enter burst times (space-separated):"
read -a burst_time

# Initialize waiting time and turnaround time
waiting_time[0]=0
turnaround_time[0]=${burst_time[0]}

for ((i=1; i<n; i++))
do
  waiting_time[i]=$((waiting_time[i-1] + burst_time[i-1]))
  turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
done

# Display results
echo -e "\nProcess\tBurst Time\tWaiting Time\tTurnaround Time"
for ((i=0; i<n; i++))
do
  echo -e "$((i+1))\t${burst_time[i]}\t\t${waiting_time[i]}\t\t${turnaround_time[i]}"
done
