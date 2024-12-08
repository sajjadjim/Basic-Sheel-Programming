# 3. SJF Without Arrival Time
# Shortest Job First (SJF) scheduling without considering arrival time.

echo "Enter the number of processes:"
read n

echo "Enter burst times (space-separated):"
read -a burst_time

# Sort burst times and calculate waiting and turnaround times
sorted_burst_time=($(for bt in "${burst_time[@]}"; do echo $bt; done | sort -n))

waiting_time[0]=0
turnaround_time[0]=${sorted_burst_time[0]}

for ((i=1; i<n; i++))
do
  waiting_time[i]=$((waiting_time[i-1] + sorted_burst_time[i-1]))
  turnaround_time[i]=$((waiting_time[i] + sorted_burst_time[i]))
done

# Display results
echo -e "\nProcess\tBurst Time\tWaiting Time\tTurnaround Time"
for ((i=0; i<n; i++))
do
  echo -e "$((i+1))\t${sorted_burst_time[i]}\t\t${waiting_time[i]}\t\t${turnaround_time[i]}"
done
