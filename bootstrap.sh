#!/bin/bash


if [ ! -f /tmp/provisioned ]; then
	apt-get update
	apt-get install -y daemon wget unzip
	touch /tmp/provisioned
fi


if [ -f "/usr/local/bin/consul" ]; then
	echo consul already installed
else
	wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -O /tmp/consul.zip 2&>1 > /dev/null
	unzip /tmp/consul.zip -d /usr/local/bin/
	chmod 755 /usr/local/bin/consul
	rm /tmp/consul.zip
fi


if [ -d "/opt/consul/web/dist" ]; then
	echo consul ui already installed
else
	mkdir -p /opt/consul/web
	wget https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -O /tmp/consul-ui.zip 2&>1 > /dev/null
	unzip /tmp/consul-ui.zip -d /opt/consul/web/
	rm /tmp/consul-ui.zip
fi

if pgrep "consul" > /dev/null; then
	echo consul already running
else
	mkdir -p /opt/consul/data 
	daemon -X "consul agent -server -client=0.0.0.0 -ui-dir /opt/consul/web/dist -data-dir /opt/consul/data -bind 0.0.0.0 -syslog -bootstrap-expect 1"
fi


if [ -f "/etc/init.d/git2consul" ]; then
	echo git2consul already installed
else
	apt-get install -y nodejs

	dpkg -i /vagrant/git2consul-tools/build/git2consul-amd64.deb
	dpkg -i /vagrant/git2consul-tools/build/git2consul-tools-amd64.deb

	git2consul-config_seeder /vagrant/git2consul.json

	service git2consul start
fi




