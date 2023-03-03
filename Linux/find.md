`find ./Directory -name file.txt` ~ Searches for the file in the given Directory

`find ./Directory -name *.txt` ~ Searches all files with the extension .txt in all 

`find ./Directory -empty` ~ Finds empty folders

`find ./Directory -perm 777` ~ Finds files with the perm '777'

`find ./Directory -type f -name "*" -exec grep 'knightfall {} \;` ~ finds files having the word 'knightfall' and prints the name of the file ig.
