FROM ubuntu:18.04

# THIS IMAGE IS BASED ON THIS PROYECT'S DOCKERFILE:
# https://hub.docker.com/r/ndslabs/xpra-base/dockerfile

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive \
apt-get install --no-install-recommends -y \
fonts-dejavu \
git \
python-websockify \
vim \
wget \
x11-utils \
xfonts-base \
xvfb \
xpra 

# Uncomment this and the corresponding line on entrypoint.sh
RUN apt-get -y install firefox

COPY index.html /usr/share/xpra/www
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh
VOLUME /root
EXPOSE 10000

CMD [ "/entrypoint.sh"]