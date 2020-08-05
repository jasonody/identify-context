#! /bin/bash

context_identifier=src/contexts/

file_count=$(git diff --name-only HEAD~1 HEAD | wc -l)

context_file_count=$(git diff --name-only HEAD~1 HEAD | grep $context_identifier | wc -l)

# echo $file_count
# echo $context_file_count

if [ $file_count -ne $context_file_count ]
then
  echo
else
  echo $(git diff --name-only HEAD~1 HEAD | grep $context_identifier | tr '/' ' ' | awk '{print $3}' | sort | uniq) 
fi