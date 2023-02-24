#!/bin/bash

echo "Executing the File 'file.c'  ... "

gcc -o myprog main.o /home/knightfall/Code/SysSec/Assignment/Q1/libfirst.a /home/knightfall/Code/SysSec/Assignment/Q2/libsec.so

./myprog

sleep 3

echo "Executing the Python program "arm.py"  ..."

python /home/knightfall/Code/SysSec/Assignment/Q4/arm.py
