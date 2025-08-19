export ASDF_DIR=$HOME/.config/asdf
export ASDF_DATA_DIR=$HOME/.config/asdf

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

. <(asdf completion bash)
