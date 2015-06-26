
## Build

	apt-get install -y nodejs npm ruby-dev build-essential
	gem install fpm
	
	# check the npm install path on your build system and update 
	# `git2consul` and `git2consul-config_seeder` accordingly:
	# `npm list -g | head -n 1`
	
	make

## Notes

	
	# git2consul-config_seeder
	nodejs /usr/local/lib/node_modules/git2consul/utils/config_seeder.js /vagrant/git2consul.json

	# git2consul
	nodejs /usr/local/lib/node_modules/git2consul/

## Docker

	sudo docker build -t consulkv .
	sudo docker run -p 8500:8500 consulkv
