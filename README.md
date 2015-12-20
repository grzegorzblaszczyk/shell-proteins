# shell-proteins

## What are shell-proteins

Shell Proteins is an easily extensible framework to write and reuse BASH functions in your Shell scripts.

### Usage

Just write a simple function, save it in a .sh file and push it to GitHub.

You can then reuse it by simply adding one line in your Shell scripts:

``` 
source "$HOME/bin/shell-proteins/bash/base.inc.sh" 

# Import core function
protein_require "core/print_usage"

[...]

# This is an actual usage of a simple function:
print_usage "first_param" "second_param"
```

You can also use your own functions:

```
#!/bin/bash
source "$HOME/bin/shell-proteins/bash/base.inc.sh"

protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/ubuntu/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/ubuntu/verify_if_installed_with_dot.inc.sh"

FFMPEG=`which ffmpeg`

echo -n "Verifying if all necessary software is installed ."
verify_if_installed_with_dot ffmpeg ${FFMPEG}
echo "[OK]"

```

Naming based on: http://www.scientificamerican.com/article/how-are-seashells-created/

## Installation

```\curl -sSL https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins/master/install.sh | bash```
