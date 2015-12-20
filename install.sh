#!/bin/bash

GIT=`which git`
MKDIR=`which mkdir`

if [ "x$GIT" == "x" ]; then
  echo "You need to install git first"
  exit 1;
fi

$MKDIR -p $HOME/bin

$GIT clone https://github.com/grzegorzblaszczyk/shell-proteins.git $HOME/bin/shell-proteins

echo "Now you can use Shell Proteins in your BASH scripts by putting following line at the top:"
echo ""
echo "source \"\$HOME/bin/shell-proteins/bash/base.inc.sh\""
echo ""



