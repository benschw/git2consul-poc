## git2consul demo


### build git2consul deb

	apt-get install -y nodejs npm ruby-dev build-essential
	gem install fpm
	
	fpm -s npm -t deb git2consul

### run

	nodejs /usr/local/lib/node_modules/git2consul/utils/config_seeder.js /vagrant/git2consul.json
	nodejs /usr/local/lib/node_modules/git2consul/
