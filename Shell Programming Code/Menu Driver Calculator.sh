while true
do
  echo -e "\nCalculator Menu"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Exit"
  echo "Enter your choice:"
  read choice

  if ((choice == 5))
  then
    echo "Exiting..."
    break
  fi

  echo "Enter two numbers:"
  read a
  read b

  case $choice in
    1) echo "Result: $((a + b))";;
    2) echo "Result: $((a - b))";;
    3) echo "Result: $((a * b))";;
    4) 
      if ((b == 0))
      then
        echo "Division by zero is not allowed"
      else
        echo "Result: $((a / b))"
      fi
      ;;
    *) echo "Invalid choice";;
  esac
done
