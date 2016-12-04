#!/bin/bash  

defaults write NSGlobalDomain KeyRepeat -int 0.02
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
chflags nohidden ~/Library
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
brew update && brew upgrade

brew install automake colordiff curl git  
brew install hub libmemcached memcached openssl
brew cask install iterm2
brew cask install firefox
brew cask install google
brew cask install opera

brew cask install sublime-text
brew cask install filezilla
brew cask install virtualbox
brew cask install phpstorm
brew cask install axure-rp
brew cask install sequel-pro
brew cask install mysqlworkbench

brew install node
sudo npm install -g phonegap
sudo npm install -g cordova
brew install ant watchman
sudo npm install -g react-native-cli

brew install maven
brew install gradle
brew install android-sdk
brew install android-ndk
android update sdk --no-ui
brew cask install android-studio

brew install imagemagick ffmpeg
npm install -g bower

brew cask install vagrant
brew cask install vagrant-manager
vagrant plugin install vagrant-parallels
brew install ansible
brew install docker boot2docker
brew cask install docker-compose

brew install v8
sudo gem install therubyracer
sudo gem install libv8 -v 3.16.14.3 -- --with-system-v8

brew cask install alfred
brew cask install skype
brew cask install spotify

brew install mysql
brew pin mysql

brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install --without-apache --with-fpm --with-mysql php55
