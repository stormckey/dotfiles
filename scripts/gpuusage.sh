echo "$(radeontop -l 1 -d - | grep "gpu" |  sed -E 's/.*gpu ([0-9]+\.[0-9]+%).*/\1/' | awk '{printf "%.0f%%\n", $1}') "
