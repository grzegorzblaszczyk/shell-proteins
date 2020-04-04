#!/bin/bash
source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"

if [ "x$1" == "x" ]; then
  print_usage "file" "local_repo"
  exit 1;
fi

CP=`which cp`

echo "Local install from ${1} to $HOME/bin/shell-proteins/ext/${2}..."

${CP} ${1} "$HOME/bin/shell-proteins/ext/${2}"
