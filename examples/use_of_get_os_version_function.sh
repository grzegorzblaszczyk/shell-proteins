#!/bin/bash

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os/get_os_version" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os/get_os_version.inc.sh"

echo "Current operating system: `get_os_version`"
