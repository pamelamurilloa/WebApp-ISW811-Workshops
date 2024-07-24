#!/bin/bash

echo "Please type your birth year:"
read year

if [[ -z "$year" ]]; then
    echo "You didn't type anything"
elif [[ ! "$year" =~ ^[0-9]{4}$ ]]; then
    echo "You should introduce an actual number"
elif [[ "$year" -lt 1900 && "$year" -gt 2025 ]]; then
    echo "The year must be between 1900 and 2024"
else 
    if [ "$year" -ge 1946 ] && [ "$year" -le 1964 ]; then
        echo "You're a Baby Boomer"
    elif [ "$year" -ge 1965 ] && [ "$year" -le 1980 ]; then
        echo "You're from the X Generation"
    elif [ "$year" -ge 1981 ] && [ "$year" -le 1996 ]; then
        echo "You're a Millenial"
    elif [ "$year" -ge 1997 ] && [ "$year" -le 2012 ]; then
        echo "You're from the Z Gen"
    elif [ "$year" -ge 2013 ]; then
        echo "You're from the Alpha Generation"
    else
        echo "We don't have a generation for you"
    fi
fi