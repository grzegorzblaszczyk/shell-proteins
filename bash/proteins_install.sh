#!/bin/bash
source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"

if [ "x$1" == "x" ]; then
  print_usage "URL"
  exit 1;
fi

echo "Downloading ${1}..."
protein_download ${1}
