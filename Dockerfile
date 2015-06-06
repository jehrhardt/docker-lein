FROM java:8

MAINTAINER Jan Ehrhardt <jan.ehrhardt@gmail.com>

# Enable running leinigen as root
ENV LEIN_ROOT 1

# Install leinigen to /usr/local/lib/lein
ENV LEIN_HOME /usr/local/lein
ADD https://raw.githubusercontent.com/technomancy/leiningen/2.5.1/bin/lein /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein

# The `lein` command above will download leiningen automatically to this volume
VOLUME ["/usr/local/lein/self-installs"]

# Set leiningen's local Maven repository
VOLUME ["/var/lib/lein/maven-repo"]
ADD repl-profile.clj $LEIN_HOME/profiles.d/repl.clj

# Make leiningen's REPL accessible via port 47480
ENV LEIN_REPL_HOST "0.0.0.0"
ENV LEIN_REPL_PORT 47480
EXPOSE 47480

# Allow mounting of project directory as working directory
WORKDIR /project

# This image is made to run leinigen
ENTRYPOINT ["lein"]

# Start a REPL by default
CMD ["repl"]
