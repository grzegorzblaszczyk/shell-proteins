#!/bin/bash

source "$HOME/bin/shell-proteins/bash/base.inc.sh"

protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os/get_os_version" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os/get_os_version.inc.sh"
os_version="`get_os_version`"
echo "os version: ${os_version}"

case "$os_version" in
MacOSX)
  os="mac"
  ;;
Ubuntu)
  os="ubuntu"
  ;;
*)
  os="unknown"
  ;;
esac

protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/${os}/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/mac/verify_if_installed_with_dot.inc.sh"

verify_if_installed_with_dot "convert" "/usr/local/bin/convert"

echo ""
echo "Assuming that foo-nonexistent is NOT installed..."

verify_if_installed_with_dot "foo-nonexistent" "/usr/bin/foo-nonexistent"


