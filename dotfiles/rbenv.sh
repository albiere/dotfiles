export PATH="$HOME/.rbenv/bin:$PATH"

# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your /Users/angeloalbiero/.bash_profile:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

eval "$(rbenv init -)"
