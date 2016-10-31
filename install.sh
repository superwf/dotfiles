#!/bin/bash

# check command exist
type curl > /dev/null 2>&1 || sudo apt-get curl -y
type git > /dev/null 2>&1 || sudo apt-get git-core -y
type vim > /dev/null 2>&1 || sudo apt-get vim -y
sudo bash symlink-dotfiles.sh

# install nvm then use nvm install nodejs
test -d ~/.nvm || curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
# install rvm then use rvm install ruby
test -d ~/.rvm || curl -L https://get.rvm.io | bash -s stable --autolibs=enabled [--ruby] [--rails] [--trace]
# type rvm > /dev/null 2>&1 || curl -L https://get.rvm.io | bash -s stable --autolibs=enabled [--ruby] [--rails] [--trace]
