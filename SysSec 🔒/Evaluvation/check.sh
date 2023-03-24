#!/bin/bash

echo "Executing the binary file from file.c :"
echo " "
gcc -o binary file.o Q1/libsec.so Q2/libfirst.a 
./binary
echo " "

python ./Q3/Palindrome.py

