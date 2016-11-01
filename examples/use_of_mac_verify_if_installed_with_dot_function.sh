#!/bin/bash

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/mac/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/mac/verify_if_installed_with_dot.inc.sh"

echo "Assuming that ImageMagick convert is installed..."

verify_if_installed_with_dot "convert" "/usr/local/bin/convert"

echo ""
echo "Assuming that foo-nonexistent is NOT installed..."

verify_if_installed_with_dot "foo-nonexistent" "/usr/bin/foo-nonexistent"


