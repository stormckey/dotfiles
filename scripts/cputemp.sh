sensors | grep --after-context=3 'k10temp' | grep 'Tctl' | sed -E 's/.*\+([0-9]+)\.[0-9]°C/\1°C/'
