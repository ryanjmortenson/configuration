#! /bin/bash

set -e

# Replace carriage return with new line
find . -name "*.[ch]" -exec sed -i 's!\r\n!\n!g' {} \; 

# Replace whitespace errors
find . -name "*.[ch]" -exec sed -i 's!\s\+$!!g' {} \;

# Indent files
find . -name "*.[ch]" -exec indent {} -o {} \;

# Replace whitespace errors
find . -name "*.[ch]" -exec sed -i 's!\s\+$!!g' {} \;
