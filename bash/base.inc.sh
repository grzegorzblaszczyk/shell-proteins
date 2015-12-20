#!/bin/bash

META_DATA=""
MKDIR=`which mkdir`
LOCAL_FILE=""

WGET=`which wget`

function protein_log(){
  LOG_PREFIX="==> Shell Proteins:"
  echo "${LOG_PREFIX} $1"
}

function protein_download() {
  REMOTE_RESOURCE=$1
  OLD_IFS=$IFS
  IFS='/' read -r -a META_DATA <<< "${REMOTE_RESOURCE}"
  IFS=$OLD_IFS

  LOCAL_EXT_PATH="$HOME/bin/shell-proteins/ext"
  REMOTE_AUTHOR="${META_DATA[3]}"
  REMOTE_REPO="${META_DATA[4]}"
  REMOTE_FUNCTION_PATH=${REMOTE_RESOURCE##*bash/}

  LOCAL_FILE="${LOCAL_EXT_PATH}/${REMOTE_AUTHOR}/${REMOTE_REPO}/bash/${REMOTE_FUNCTION_PATH}"
  LOCAL_DIR=${LOCAL_FILE%/*}

  $MKDIR -p "${LOCAL_DIR}"

  protein_log "Downloading ${REMOTE_RESOURCE} to ${LOCAL_DIR}..."
  $WGET -q -O "${LOCAL_FILE}" "${REMOTE_RESOURCE}" 

  RESULT=$?
  if [ $RESULT != 0 ]; then
    protein_log "!!! Shell Proteins error: downloading ${REMOTE_RESOURCE} failed !!!"
    exit 1;
  fi
}

function protein_require() {
  FUNCTION_FILE=$1
  REMOTE_RESOURCE=$2

  WGET=`which wget`

  if [ -f "$HOME/bin/shell-proteins/bash/${FUNCTION_FILE}.inc.sh" ]; then 
    source "$HOME/bin/shell-proteins/bash/${FUNCTION_FILE}.inc.sh"
  else
    if [ -f "$HOME/bin/shell-proteins/ext/${FUNCTION_FILE}.inc.sh" ]; then 
      source "$HOME/bin/shell-proteins/ext/${FUNCTION_FILE}.inc.sh"
    else
      if [ "x${WGET}" == "x" ]; then
        protein_log "error: cannot locate wget binary - please add it to your $PATH !!!" 
        exit 1;
      fi

      protein_download $REMOTE_RESOURCE
      source "$HOME/bin/shell-proteins/ext/${FUNCTION_FILE}.inc.sh"
    fi
  fi
}