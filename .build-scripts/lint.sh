#! /bin/bash

echo "Linting GDScript files"

find . -name "*.gd" -print0 | while read -d $'\0' file
do
    gdlint $file
done
