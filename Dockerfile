FROM java:8

MAINTAINER Jan Ehrhardt <jan.ehrhardt@gmail.com>

# Enable running leinigen as root
ENV LEIN_ROOT 1

# Install leinigen to /opt/lein
ENV LEIN_HOME /opt/lein
ADD https://github.com/technomancy/leiningen/releases/download/2.5.1/leiningen-2.5.1-standalone.zip $LEIN_HOME/self-installs/leiningen-2.5.1-standalone.jar
ADD https://raw.githubusercontent.com/technomancy/leiningen/2.5.1/bin/lein $LEIN_HOME/bin/lein
RUN chmod +x $LEIN_HOME/bin/lein
ENV PATH $PATH:$LEIN_HOME/bin

ADD repl-profile.clj $LEIN_HOME/profiles.d/repl.clj

# Make leiningen's REPL accessable via port 47480
ENV LEIN_REPL_HOST "0.0.0.0"
ENV LEIN_REPL_PORT 47480
EXPOSE 47480

# This image is made to run leinigen
ENTRYPOINT ["lein"]

# Start a REPL by default
CMD ["repl"]
