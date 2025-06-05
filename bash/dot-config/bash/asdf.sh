source $HOME/.config/asdf/asdf.sh
source $HOME/.config/asdf/completions/asdf.bash

export ASDF_DIR=$HOME/.config/asdf
export ASDF_DATA_DIR=$HOME/.config/asdf

export PATH="/usr/local/opt/asdf/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
