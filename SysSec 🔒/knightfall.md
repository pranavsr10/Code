USER creation :

```
sudo useradd -m knightfall ~ Adds a new user and creates home directory

sudo usermod -aG sudo knightfall ~ Adds the new user 

```
SSH :

```
ssh-keygen ~ Creates a rsa key

ssh knightfall@127.0.0.1 ~ Password Based Authenctication

ssh-copyid knightfall2@127.0.0.1 ~ With Private key

```

Static Linking:

```
gcc -c file.c -o file.o

ar rcs libraryname.a file.o

```
Dynamic:

```
gcc -c file.c -o file.o

gcc -shared -o library.so file.o file1.o

or

gcc -shared -o libsec.so -fPIC file.c

```
LINKING BOTH LIBRARIES:

```
gcc -c mainfile.c -o mainfile.o

gcc -o binaryfile mainfile.c library1.a library1.so

./binaryfile

```

TELNET:

```
telnet ipaddress

     or

telnet localhost

```

