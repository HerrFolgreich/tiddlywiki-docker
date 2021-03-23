FROM node:14.15-buster-slim

LABEL org.opencontainers.image.authors "ChrisBraucker"
LABEL org.opencontainers.image.source "https://github.com/chrisbraucker/tiddlywiki-docker"
LABEL org.opencontainers.image.description "TiddlyWiki Node App, see this containers GitHub repo for more info"

RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
