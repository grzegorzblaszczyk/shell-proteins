# shell-proteins

## What is shell-proteins?

Shell Proteins is an easily extensible framework to write and reuse BASH functions in your Shell scripts.
Ruby has its RubyGems (`gem`), Node.js has its Node Package Manager `npm`, now bash can have its own: `shell-proteins`

### Usage

Just write a simple function, save it in a .sh file and push it to GitHub.

```
#!/bin/bash

# Function: print_usage
# 
# input params: any parameters that should be printed in usage line (space separated)
# output: standard output with text how to use a BASH script

function print_usage() {
  args=("$@")
  echo ""
  echo "Usage:"
  echo -n "$0 "
  for (( i=0; i < $#; i++ )); do
    echo -n "[${args[$i]}] "
  done
  echo ""
}
```

You can then reuse it by simply adding one line in your Shell scripts:

``` 
#!/bin/bash
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
Shell Proteins will download the script from a remote location if necessary. It will then reuse the function in your script.

In this example if you have ffmpeg installed on your system, then the result when invoking this script would be:

```
Verifying if all necessary software is installed ..[OK]
```

If you do NOT have ffmpeg installed on your system, then the result of this script would be:

```
Verifying if all necessary software is installed ..
Please install ffmpeg on your system. Probably you can do it by running:
sudo apt-get install ffmpeg
```


Naming based on: http://www.scientificamerican.com/article/how-are-seashells-created/

## Installation

```\curl -sSL https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins/master/install.sh | bash```
