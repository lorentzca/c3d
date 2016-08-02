FROM alpine

# install consul
RUN \
  apk --update add --no-cache --virtual build-dependencies \
  curl \
  wget \
  unzip && \
  wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip && \
  unzip consul_0.6.4_linux_amd64.zip && \
  rm -f consul_0.6.4_linux_amd64.zip && \
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
