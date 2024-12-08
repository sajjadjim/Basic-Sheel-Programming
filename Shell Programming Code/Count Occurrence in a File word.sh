echo "Enter the file name:"
read filename

if [ -e "$filename" ]
then
  echo "Enter the word to count:"
  read word
  count=$(grep -o -i "\\b$word\\b" "$filename" | wc -l)
  echo "The word '$word' occurs $count times in the file."
else
  echo "File not found"
fi
