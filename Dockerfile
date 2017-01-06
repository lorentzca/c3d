FROM alpine

# consul version
ARG version="0.6.4"

# install consul
RUN \
  apk --update add --no-cache --virtual build-dependencies \
  curl \
  wget \
  unzip && \
  wget https://releases.hashicorp.com/consul/${version}/consul_${version}_linux_amd64.zip && \
  unzip consul_${version}_linux_amd64.zip && \
  rm -f consul_${version}_linux_amd64.zip && \
  mv consul /usr/local/bin && \
  chmod 755 /usr/local/bin/consul && \
  mkdir -p /etc/consul.d/leader && \
  mkdir -p /etc/consul.d/server && \
  mkdir -p /etc/consul.d/client && \
  apk del build-dependencies

# configure consul
COPY ./leader.json    /etc/consul.d/leader/config.json
COPY ./server.json    /etc/consul.d/server/config.json
COPY ./client.json    /etc/consul.d/client/config.json

# consul web ui
COPY ./consul_web_ui /var/www/consul_web_ui
