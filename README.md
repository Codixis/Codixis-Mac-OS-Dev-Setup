# ![codixis](media/codixis.png)

Codixis Mac OS Dev Setup 
========
Use at your own risk :) 

## First steps ..
### Install editors & MAMP
``` bash
1. Download Sublime Text 
2. Download PHP Storm 9
3. Install MAMP PRO 2.2
>> Setup PHP storm for Symfony : https://confluence.jetbrains.com/display/PhpStorm/Getting+Started+-+Symfony+Development+using+PhpStorm
```

### Install Brew and composer 
``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
brew update && brew upgrade
```

### Install browser and virtualbox 
``` bash
1. virtual box 
2. firefox
3. opera
4. chrome 
```

### Install Axure 6 
``` bash
Old version of Axure from their website 
```

### Install mobile dev environment 
``` bash
1. phonegap

brew update
brew install node
sudo npm install -g phonegap

2. gapdebug
3. android sdk
4. cordova

sudo npm install -g cordova
brew install ant
brew install imagemagick

5. xcode (create an iTunes account with your e-mail) 
xcode-select --install

```

### Database software
``` bash
1. Sequel Pro
2. sql workbench
3. skipper
```

### Misc
``` bash
brew install imagemagick
brew install ffmpeg
npm install -g bower
```

### Setting up PHP for Symfony built in server
``` bash
cp /etc/php.ini.default /etc/php.ini
## Add : date.timezone = Europe/Paris

ln -s /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include /Applications/MAMP/bin/php/php5.5.26
brew install autoconf icu4c
pecl install intl
## When asked for the path to the ICO libraries and headers, answer with : /usr/local/opt/icu4c

## Then add the real path of "intl.so" to your /etc/php.ini file, for example : /Applications/MAMP/bin/php/php5.5.26/lib/php/extensions/no-debug-non-zts-20121212/intl.so
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

