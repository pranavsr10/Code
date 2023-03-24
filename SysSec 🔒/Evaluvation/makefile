all: Linking Permission Execution 

Linking:
	@gcc -c ./Q2/reverse.c
	@gcc -c ./Q2/fibonacci.c
	@ar rcs ./Q2/libfirst.a ./Q2/reverse.o ./Q2/fibonacci.o
	@echo "Linked Question 2"	
	@gcc -shared -o ./Q1/libsec.so -fPIC ./Q1/prime.c ./Q1/printingnumber.c
	@echo "Linked Question 1"
	@gcc -c file.c
	@gcc -o binary file.o ./Q1/libsec.so ./Q2/libfirst.a
	@echo "Program Executed"
	# @./myprog
  
Permission:
	@chmod +x check.sh

Execution:
	@sh check.sh

