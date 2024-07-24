#!bin/bash

echo "Please type your name"
read name

if [ -z "$name" ]; then
    echo "I would've loved to meet you"
else
    echo "Hello $name"
fi