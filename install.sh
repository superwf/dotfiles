#!/bin/bash

dir="$HOME"
cd $dir
git clone --recursive git://github.com/paulmillr/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh

# only for system like debian/ubuntu
# install curl
sudo apt-get install vim curl git-core -y
# install nvm then use nvm install nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
# install rvm then use rvm install ruby
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled [--ruby] [--rails] [--trace]
