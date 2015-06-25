SHELL=/bin/bash
VERSION := $(shell cat VERSION)
ITTERATION := $(shell date +%s)

# # drone build
# sudo apt-get update
# sudo apt-get install ruby-dev build-essential rubygems wget curl
# sudo gem install fpm
# make deps test build deb gzip

all: debs


build:
	mkdir -p build

build-tools:
	mkdir -p build/root/usr/bin
	mkdir -p build/root/etc/init.d
	cp git2consul.init build/root/etc/init.d/git2consul
	chmod 755 build/root/etc/init.d/git2consul
	cp git2consul git2consul-config_seeder build/root/usr/bin/
	chmod 755 build/root/usr/bin/git2consul build/root/usr/bin/git2consul-config_seeder


clean:
	rm -rf build


git2consul-deb: build
	fpm -s npm -t deb -p build/git2consul-and64.deb git2consul 

# sudo apt-get install ruby-dev build-essential
# sudo gem install fpm
git2consul-tools-deb: build-tools
	fpm -s dir -t deb -n git2consul-tools -v $(VERSION) -p build/git2consul-tools-amd64.deb \
		--deb-priority optional \
		--force \
		--iteration $(ITTERATION) \
		--deb-compression bzip2 \
		--description "Init script and wrapper scripts for git2consul npm package" \
		-m "Ben Schwartz <benschw@gmail.com>" \
		--license "Apache License 2.0" \
		--vendor "fliglio.com" -a amd64 \
		build/root/=/

debs: git2consul-deb git2consul-tools-deb
