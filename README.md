# ![codixis](media/codixis.png)

Codixis Mac OS Dev Setup - Sierra
========
Use at your own risk :) 

## Use the lazy script ...

### Download the script 
``` bash
# Install
wget https://raw.githubusercontent.com/Codixis/Codixis-Mac-OS-Dev-Setup-El-Captain/master/script.sh
chmod 700 script.sh
./script.sh

```

### Useful commands   
``` bash

## Stop
php-fpm.stop
sudo nginx -s stop

## Start
php-fpm.start
sudo nginx

```


## Old stuff, will be deleted

### Setup Github
``` bash
ssh-keygen -t rsa -C "user@codixis.com"

# Copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "My User"
git config --global user.email "user@codixis.com"
git config --global github.user myuser
git config --global github.token your_token_here

git config --global core.editor "subl -w"
git config --global color.ui true
```

### Configure Phpstorm.  
``` bash
1. Setup PHP storm for Symfony : https://confluence.jetbrains.com/display/PhpStorm/Getting+Started+-+Symfony+Development+using+PhpStorm
2. Add the dark template in the settings 
```

### Configure Tunnel blick, Sublime Text


## Using Docker for Symfony 

### Prepare your project 
``` bash
# In your phpstorm environment, clone docker symfony : 
git clone git@github.com:eko/docker-symfony.git

# Next, put your Symfony application into symfony folder and do not forget to add symfony.dev in your /etc/hosts file.
```

### Run Docker 
``` bash
docker-compose up

# You are done, you can visite your Symfony application on the following URL: http://symfony.dev (and access Kibana on http://symfony.dev:81)

# To rebuild Docker images :
docker-compose build
```

## Using Vagrant for Symfony 
#### Requirements 
Vagrant
Ansible
Virtualbox

### Prepare your project 
``` bash
# In your phpstorm environment, clone : 
git clone git@github.com:albertcolom/custom-ansible-vagrant.git

# Add domain in hosts
echo "10.10.10.10 web.dev >> /etc/hosts"
```

### Run Vagrant 
``` bash
# run vagrant (for the first time it should take up to 20-30 min)
vagrant up

# Links :
Web Server: http://web.dev or http://10.10.10.10
Adminer: http://web.dev/adminer or http://10.10.10.10/adminer
Elasticsearch: http://web.dev:9200 or http://10.10.10.10:9200
ElasticHQ: http://web.dev:9200/_plugin/HQ/ or http://10.10.10.10:9200/_plugin/HQ/
```

#### Installed components :
Apache 2   
PHP 5.6   
MySQL   
Elasticsearch   
ElasticHQ   
Nodejs   
APC   
Memcached   
Symfony installer   
Composer (Globally)   
Adminer   
Vim   
Git   
Htop   
Python-pip   
Curl   
Sendmail   
Unzip   
Tmux   
Zsh (Default shell)   
Figlet   
Openjdk-7-jdk   
Httpie   
Npm  
Imagemagick   

### Setting up PHP for Symfony built in server
``` bash
cp /etc/php.ini.default /etc/php.ini
## Add : date.timezone = Europe/Paris

ln -s /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include /Applications/MAMP/bin/php/php5.5.26
brew install autoconf icu4c
pecl install intl
## When asked for the path to the ICO libraries and headers, answer with : /usr/local/opt/icu4c

## Then replace the real path of "intl.so" to your /etc/php.ini file, for example : /Applications/MAMP/bin/php/php5.5.26/lib/php/extensions/no-debug-non-zts-20121212/intl.so

pecl install xdebug
# add to /etc/php.ini :
zend_extension=/usr/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so  # with your path to xdebug.so
# add to /etc/php.ini :
[xdebug]
xdebug.remote_enable=1
xdebug.remote_host=localhost
xdebug.remote_port=9000
xdebug.remote_handler="dbgp"
xdebug.max_nesting_level = 256
# restart Apache
apachectl restart

```

## Explanations

### Mac environment setup 
``` bash
#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
```

### Install Brew and composer 
``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
brew update && brew upgrade
```

### Software install with brew cast
``` bash
# homebrew-cask => No needed anymore
# brew tap phinze/homebrew-cask
# brew install brew-cask

# basic tools
brew install automake colordiff curl git  
brew install hub libmemcached memcached openssl 
brew cask install iterm2
brew cask install gitx
brew cask install tunnelblick

# browser
brew cask install firefox
brew cask install google
brew cask install opera

# development
brew cask install sublime-text
brew cask install filezilla
brew cask install virtualbox
brew cask install phpstorm
brew cask install axure-rp
brew cask install sequel-pro
brew cask install mysqlworkbench

# nodejs and phonegap and cordova and native react
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

# dev tools
brew install imagemagick ffmpeg
npm install -g bower

# Vagrant & docker
brew cask install vagrant
brew cask install vagrant-manager
vagrant plugin install vagrant-parallels
brew install ansible
brew install docker boot2docker
brew cask install docker-compose
boot2docker init
boot2docker up

# Ruby
# brew uninstall v8
# gem uninstall libv8
brew install v8
sudo gem install therubyracer
sudo gem install libv8 -v 3.16.14.3 -- --with-system-v8

# Misc
brew cask install alfred
brew cask install skype
brew cask install spotify
```

## Local Lemp environment setup (if not using Vagrant or Docker) 

### Install and setup mysql 
``` bash
# Install
brew install mysql
brew pin mysql

## Setup
# Copy launch agent into place
mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/VERSION/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/

# Edit launch agent and set both keepalive and launch at startup to false
vi ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Inject launch agent
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

# Start mysql
start mysql

# Secure mysql
/usr/local/Cellar/mysql/VERSION/bin/mysql_secure_installation
```

### Installing nginx with PHP-FPM
``` bash
## Install PHP 
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install --without-apache --with-fpm --with-mysql php55

## Set autostart
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/php55/5.5.18/homebrew.mxcl.php55.plist ~/Library/LaunchAgents/

## Start php and check it's working
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist
lsof -Pni4 | grep LISTEN | grep php

## Install Nginx
brew install nginx

## Add auto start
sudo cp /usr/local/opt/nginx/*.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

## Test nginx
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
curl -IL http://localhost:8080

## Stop Nginx 
sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

## Create nginx folders
mkdir -p /usr/local/etc/nginx/logs
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
mkdir -p /usr/local/etc/nginx/conf.d
mkdir -p /usr/local/etc/nginx/ssl
sudo mkdir -p /var/www
sudo chown :staff /var/www
sudo chmod 775 /var/www

## Change nginx & php-fpm conf
rm /usr/local/etc/nginx/nginx.conf
curl -L https://gist.github.com/frdmn/7853158/raw/nginx.conf -o /usr/local/etc/nginx/nginx.conf
rl -L https://gist.github.com/frdmn/7853158/raw/php-fpm -o /usr/local/etc/nginx/conf.d/php-fpm

## Create default virutal hosts
curl -L https://gist.github.com/frdmn/7853158/raw/sites-available_default -o /usr/local/etc/nginx/sites-available/default
curl -L https://gist.github.com/frdmn/7853158/raw/sites-available_default-ssl -o /usr/local/etc/nginx/sites-available/default-ssl
curl -L https://gist.github.com/frdmn/7853158/raw/sites-available_phpmyadmin -o /usr/local/etc/nginx/sites-available/phpmyadmin

## Create SSL directory and key
mkdir -p /usr/local/etc/nginx/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj '/C=US/ST=State/L=Town/O=Office/CN=localhost' -keyout /usr/local/etc/nginx/ssl/localhost.key -out /usr/local/etc/nginx/ssl/localhost.crt
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj '/C=US/ST=State/L=Town/O=Office/CN=phpmyadmin' -keyout /usr/local/etc/nginx/ssl/phpmyadmin.key -out /usr/local/etc/nginx/ssl/phpmyadmin.crt

## Enable virtual hosts
ln -sfv /usr/local/etc/nginx/sites-available/default /usr/local/etc/nginx/sites-enabled/default
ln -sfv /usr/local/etc/nginx/sites-available/default-ssl /usr/local/etc/nginx/sites-enabled/default-ssl
ln -sfv /usr/local/etc/nginx/sites-available/phpmyadmin /usr/local/etc/nginx/sites-enabled/phpmyadmin

## Start nginx again
ln -sfv /usr/local/etc/nginx/sites-available/default /usr/local/etc/nginx/sites-enabled/default
ln -sfv /usr/local/etc/nginx/sites-available/default-ssl /usr/local/etc/nginx/sites-enabled/default-ssl
ln -sfv /usr/local/etc/nginx/sites-available/phpmyadmin /usr/local/etc/nginx/sites-enabled/phpmyadmin

## Control the services
curl -L https://gist.githubusercontent.com/mgmilcher/c3a1d0138dde3eb0f429/raw/ed04e90d7770dbb62c60e1e4a912f75adc46cb5e/osx-server-aliases -o /tmp/.aliases
cat /tmp/.aliases >> ~/.profile
source ~/.profile

## You can now use this commands : 
nginx.start
nginx.stop
nginx.restart
php-fpm.start
php-fpm.stop
php-fpm.restart
nginx.logs.error
nginx.logs.access
nginx.logs.default.access
nginx.logs.default-ssl.access
nginx.logs.phpmyadmin.access

Full tutorial here : https://gist.github.com/mgmilcher/5eaed7714d031a12ed97

```
