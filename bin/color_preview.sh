#!/bin/bash


source ~/dotfiles/bash/bash_colors

# Function to print color samples
print_color_sample() {
    local color_name=${1}
    local color_value=${!color_name}
    printf "%-20s" "$color_name"
    echo -e "${color_value}This is a sample text in $color_name\033[0m"
}

# Print all color variables
for color in $(compgen -v | grep -E '^[A-Z_]+$'); do
    if [[ ${!color} == *'\033['* ]]; then
        print_color_sample "$color"
    fi
done
