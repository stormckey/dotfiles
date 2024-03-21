#! /bin/bash

input=$(hyprctl activewindow | grep class | sed -E 's/.*class: (.*)/\1/')
echo "$input"
if [[ "$input" = "Vivaldi-stable" ]]; then
    hyprctl dispatch global kando:browser_menu
else 
    hyprctl dispatch global kando:prototype_menu
fi
