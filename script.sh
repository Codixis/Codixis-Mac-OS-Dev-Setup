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
brew cask install gitx
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

brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install --without-apache --with-fpm --with-mysql php55

mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/*/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
start mysql

mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/php*/*/homebrew.mxcl.php*.plist ~/Library/LaunchAgents/
cp ~/Library/LaunchAgents/homebrew.mxcl.php*.plist ~/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php*.plist
lsof -Pni4 | grep LISTEN | grep php

brew install nginx
sudo cp /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
curl -IL http://localhost:8080
sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
mkdir -p /usr/local/etc/nginx/logs
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d
mkdir -p /usr/local/etc/nginx/ssl
sudo mkdir -p /var/www
sudo chown :staff /var/www
sudo chmod 775 /var/www
rm /usr/local/etc/nginx/nginx.conf
curl -L https://gist.github.com/frdmn/7853158/raw/nginx.conf -o /usr/local/etc/nginx/nginx.conf
curl -L https://gist.github.com/frdmn/7853158/raw/php-fpm -o /usr/local/etc/nginx/conf.d/php-fpm
curl -L https://gist.github.com/frdmn/7853158/raw/sites-available_default -o /usr/local/etc/nginx/sites-available/default
curl -L https://gist.github.com/frdmn/7853158/raw/sites-available_default-ssl -o /usr/local/etc/nginx/sites-available/default-ssl
mkdir -p /usr/local/etc/nginx/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj '/C=US/ST=State/L=Town/O=Office/CN=localhost' -keyout /usr/local/etc/nginx/ssl/localhost.key -out /usr/local/etc/nginx/ssl/localhost.crt
ln -sfv /usr/local/etc/nginx/sites-available/default /usr/local/etc/nginx/sites-enabled/default
ln -sfv /usr/local/etc/nginx/sites-available/default-ssl /usr/local/etc/nginx/sites-enabled/default-ssl
curl -L https://gist.githubusercontent.com/mgmilcher/c3a1d0138dde3eb0f429/raw/ed04e90d7770dbb62c60e1e4a912f75adc46cb5e/osx-server-aliases -o /tmp/.aliases
cat /tmp/.aliases >> ~/.profile
source ~/.profile
nginx.stop
nginx.start
php-fpm.stop
php-fpm.start
