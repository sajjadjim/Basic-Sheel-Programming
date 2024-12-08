factorial() {
  if (( $1 == 0 || $1 == 1 ))
  then
    echo 1
  else
    echo $(( $1 * $(factorial $(( $1 - 1 ))) ))
  fi
}

echo "Enter a number:"
read num
result=$(factorial $num)
echo "Factorial of $num is $result"
