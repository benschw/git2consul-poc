FROM ubuntu:14.04

RUN apt-get update && apt-get install -y supervisor nodejs git-core unzip

RUN mkdir -p /var/log/supervisor

ADD ./docker-cfg/supervisord.conf /etc/supervisor/conf.d/supervisord.conf



ADD https://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.5.0_web_ui.zip /tmp/webui.zip
RUN mkdir /ui && cd /ui && unzip /tmp/webui.zip && rm /tmp/webui.zip && mv dist/* . && rm -rf dist

ADD ./docker-cfg/consul-config.json /config/config.json



ADD ./docker-cfg/git2consul.json /git2consul.json

ADD ./build/git2consul-amd64.deb /git2consul-amd64.deb
ADD ./build/git2consul-tools-amd64.deb /git2consul-tools-amd64.deb

RUN dpkg -i /git2consul-amd64.deb
RUN dpkg -i /git2consul-tools-amd64.deb



EXPOSE 8500

CMD ["/usr/bin/supervisord"]
