count=0
total=0
while read device duration; do
    count=$(( count + 1 ))
    total=$(( total + duration ))
done <"${input:-/dev/stdin}"
echo "Average is about $(( total / count ))."