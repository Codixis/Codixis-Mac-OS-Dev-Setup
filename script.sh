#!/bin/bash  

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1 
defaults write NSGlobalDomain InitialKeyRepeat -int 10
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
brew cask install axure-rp
brew cask install sequel-pro
brew cask install mysqlworkbench
brew cask install tunnelblick

xcode-select --install
brew install node
sudo npm install -g phonegap
sudo npm install -g cordova
brew install ant watchman
sudo npm install -g react-native-cli

brew cask install java 
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

brew tap homebrew/services; brew tap homebrew/dupes
brew install php71 --with-fpm --without-apache; php -v; php-fpm -v
brew services start php71 

brew install nginx; brew services start nginx
echo 'Nginx configuration is in : /usr/local/etc/nginx';
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile && . ~/.bash_profile
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/php71/homebrew.mxcl.php71.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php71.plist
sudo cp -v /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

mkdir -p /usr/local/etc/nginx/logs
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d
mkdir -p /usr/local/etc/nginx/ssl

cp /usr/local/Cellar/mysql/*/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

sudo mkdir -p /var/www
sudo chown :staff /var/www
sudo chmod 775 /var/www
mkdir -p ~/Documents/Development/nativeReact
cd ~/Documents/Development
ln -s /var/www/
