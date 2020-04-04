#!/bin/bash

GIT=`which git`
MKDIR=`which mkdir`

if [ "x$GIT" == "x" ]; then
  echo "You need to install git first"
  exit 1;
fi

cd $HOME/bin/shell-proteins

$GIT reset --hard && $GIT pull --rebase

GIT_TAG=`${GIT} tag`

echo "Shell proteins upgraded to ${GIT_TAG}."
echo ""

