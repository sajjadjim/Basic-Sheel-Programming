# 2. FCFS With Arrival Time
# FCFS scheduling with consideration of arrival time.

echo "Enter the number of processes:"
read n

echo "Enter arrival times (space-separated):"
read -a arrival_time

echo "Enter burst times (space-separated):"
read -a burst_time

# Initialize waiting time, turnaround time, and completion time
waiting_time=()
turnaround_time=()
completion_time=()

completion_time[0]=$((arrival_time[0] + burst_time[0]))
turnaround_time[0]=$((completion_time[0] - arrival_time[0]))
waiting_time[0]=$((turnaround_time[0] - burst_time[0]))

for ((i=1; i<n; i++))
do
  if ((completion_time[i-1] < arrival_time[i]))
  then
    completion_time[i]=$((arrival_time[i] + burst_time[i]))
  else
    completion_time[i]=$((completion_time[i-1] + burst_time[i]))
  fi

  turnaround_time[i]=$((completion_time[i] - arrival_time[i]))
  waiting_time[i]=$((turnaround_time[i] - burst_time[i]))
done

# Display results
echo -e "\nProcess\tArrival Time\tBurst Time\tWaiting Time\tTurnaround Time"
for ((i=0; i<n; i++))
do
  echo -e "$((i+1))\t${arrival_time[i]}\t\t${burst_time[i]}\t\t${waiting_time[i]}\t\t${turnaround_time[i]}"
done
