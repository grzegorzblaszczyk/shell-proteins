#!/bin/bash

# Function: print_usage
# 
# input params: any parameters that should be printed in usage line (space separated)
# output: standard output with text how to use a BASH script

function print_usage() {
  args=("$@")
  echo ""
  echo "Usage:"
  echo -n "$0 "
  for (( i=0; i < $#; i++ )); do
    echo -n "[${args[$i]}] "
  done
  echo ""
}
