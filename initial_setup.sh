#!/bin/sh

pretty_print() {
  local indication="$1"; shift
  printf "\n$indication\n" "$@"
}

# Initial directory setup

DEVELOPMENT_DIR="$HOME/Development/"

for dir in $DEVELOPMENT_DIR
do
  if [ ! -d $dir ]; then
    pretty_print "Making $dir"
    mkdir $dir
  fi
done

#######

# Homebrew setup

if ! command -v brew >/dev/null; then
  pretty_print "Installing Homebrew"
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

  pretty_print "Updating PATH"
  export PATH="/usr/local/bin:$PATH"
fi

pretty_print "Updating Homebrew formulas"

brew update
brew bundle --file=- <<EOF
brew "git"
brew "openssl"
brew "the_silver_searcher"
brew "tmux"
brew "vim"
brew "imagemagick"
brew "bash-completion"
brew "libyaml"
brew "node"
brew "tmate"
brew "valgrind"
brew "htop-osx"
brew "postgresql", restart_service: true
brew "redis", restart_service: true
EOF

#######

# Ruby related setup

echo "gem: --no-document" >> ~/.gemrc

if [ ! -d "$HOME/.rvm/" ]; then
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
fi

if ! grep -Rq "source \"\$HOME\/.rvm\/scripts\/rvm\"" ~/.bash_profile; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

#######