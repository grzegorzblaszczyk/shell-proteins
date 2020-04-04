#!/bin/bash

GIT=`which git`
HEAD=`which head`
MKDIR=`which mkdir`

if [ "x$GIT" == "x" ]; then
  echo "You need to install git first"
  exit 1;
fi

PROTEINS_DIR="$HOME/bin/shell-proteins"

if [ ! -d ${PROTEINS_DIR} ]; then
  $MKDIR -p $HOME/bin
  $GIT clone https://github.com/grzegorzblaszczyk/shell-proteins.git ${PROTEINS_DIR}

  echo "Now you can use Shell Proteins in your BASH scripts by putting following line at the top:"
  echo ""
  echo "source \"\${PROTEINS_DIR}/bash/base.inc.sh\""
  echo ""
else
  cd $HOME/bin/shell-proteins

  $GIT reset --hard && $GIT pull --rebase
  GIT_TAG=`${GIT} tag | ${HEAD} -1`

  echo "Shell proteins upgraded to ${GIT_TAG}."
  echo ""
fi