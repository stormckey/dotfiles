sensors | grep "edge" | sed -E 's/.*\+([0-9]+.[0-9]+°C).*/\1/'
