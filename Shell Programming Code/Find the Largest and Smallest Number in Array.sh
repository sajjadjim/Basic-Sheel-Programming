echo "Enter numbers separated by space:"
read -a arr

largest=${arr[0]}
smallest=${arr[0]}

for num in "${arr[@]}"
do
  if ((num > largest))
  then
    largest=$num
  fi
  if ((num < smallest))
  then
    smallest=$num
  fi
done

echo "Largest: $largest"
echo "Smallest: $smallest"
