all: Linking Permission Execution 

Linking:
	@gcc -c Q1/countingdigits.c -o count.o
	@gcc -c Q1/evenorodd.c -o even.o
	@ar rcs Q1/libfirst.a even.o count.o
	@echo "Linked Question 1"	
	@gcc -shared -o Q2/libsec.so -fPIC Q2/divisible.c Q2/sumofdigits.c
	@echo "Linked Question 2"
	@gcc -c file.c -o main.o
	@gcc -o myprog main.o Q1/libfirst.a Q2/libsec.so
	@echo "Program Executed"
	# @./myprog
  
Permission:
	@chmod +x check.sh

Execution:
	@sh check.sh


