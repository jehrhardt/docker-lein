FROM java:8-jdk-alpine

MAINTAINER Jan Ehrhardt <jan.ehrhardt@gmail.com>

# Enable running leinigen as root
ENV LEIN_ROOT 1

# Install leinigen to /usr/local/lein
RUN apk add --update bash
ADD https://raw.githubusercontent.com/technomancy/leiningen/2.6.1/bin/lein /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein
ADD https://github.com/technomancy/leiningen/releases/download/2.6.1/leiningen-2.6.1-standalone.zip /usr/local/lein/self-installs/leiningen-2.6.1-standalone.jar
ENV LEIN_HOME /usr/local/lein

# Set leiningen's local Maven repository
VOLUME ["/var/lib/lein/maven-repo"]
ADD repl-profile.clj $LEIN_HOME/profiles.d/repl.clj

# Make leiningen's REPL accessible via port 47480
ENV LEIN_REPL_HOST "0.0.0.0"
ENV LEIN_REPL_PORT 47480
EXPOSE 47480

# This image is made to run leinigen
ENTRYPOINT ["lein"]
