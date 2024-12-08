# 4. Priority Without Arrival Time
# Priority scheduling without considering arrival time.

echo "Enter the number of processes:"
read n

echo "Enter burst times (space-separated):"
read -a burst_time

echo "Enter priorities (space-separated, lower number = higher priority):"
read -a priority

# Sort by priority
for ((i=0; i<n-1; i++))
do
  for ((j=0; j<n-i-1; j++))
  do
    if ((priority[j] > priority[j+1]))
    then
      # Swap priorities
      temp=${priority[j]}
      priority[j]=${priority[j+1]}
      priority[j+1]=$temp

      # Swap burst times
      temp=${burst_time[j]}
      burst_time[j]=${burst_time[j+1]}
      burst_time[j+1]=$temp
    fi
  done
done

waiting_time[0]=0
turnaround_time[0]=${burst_time[0]}

for ((i=1; i<n; i++))
do
  waiting_time[i]=$((waiting_time[i-1] + burst_time[i-1]))
  turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
done

# Display results
echo -e "\nProcess\tPriority\tBurst Time\tWaiting Time\tTurnaround Time"
for ((i=0; i<n; i++))
do
  echo -e "$((i+1))\t${priority[i]}\t\t${burst_time[i]}\t\t${waiting_time[i]}\t\t${turnaround_time[i]}"
done
