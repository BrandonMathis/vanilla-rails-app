#!/usr/bin/env bash

#DEPENDENCIES
sudo apt-get install nodejs -y
sudo apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libpq-dev -y

RVM_VERSION_TO_INSTALL='stable'
RUBY_VERSION_TO_INSTALL='2.2.3-dev'

#Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s $RVM_VERSION_TO_INSTALL

#INSTALL RUBY
source $HOME/.rvm/scripts/rvm
rvm use --default --install $RUBY_VERSION_TO_INSTALL
shift
if (( $# ))
then gem install $@
fi
rvm cleanup all
gem install bundler
gem install rails

