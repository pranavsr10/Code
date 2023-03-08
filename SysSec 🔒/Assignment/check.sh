#!/bin/bash

echo "Executing the File 'file.c'  ... "

gcc -o myprog main.o Q1/libfirst.a Q2/libsec.so

./myprog

sleep 2

echo "Executing the Python program "arm.py"  ..."

python Q4/arm.py
