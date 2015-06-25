

	apt-get install -y nodejs npm ruby-dev build-essential
	gem install fpm
	
	make

notes

	nodejs /usr/local/lib/node_modules/git2consul/utils/config_seeder.js /vagrant/git2consul.json
	nodejs /usr/local/lib/node_modules/git2consul/
