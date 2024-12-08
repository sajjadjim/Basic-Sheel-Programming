echo "Enter the number of terms:"
read n

a=0
b=1

echo "Fibonacci sequence:"
for ((i=0; i<n; i++))
do
  echo -n "$a "
  temp=$((a + b))
  a=$b
  b=$temp
done
echo
