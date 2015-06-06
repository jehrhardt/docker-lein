Run [leinigen](http://leiningen.org) in a Docker container.

## Usage
Run a Clojure REPL

```sh
docker run -it jehrhardt/lein
```

Run a headless REPL and make it available under port 8080

```sh
docker run -it -p 8080:47480 jehrhardt/lein repl :headless
```

Everytime you run a new container, leinigen and all the dependencies will be downloaded. To prevent this, you can create a named container and start it again.

```sh
# Create a new leinigen container
docker run -it --name=my-repl jehrhardt/lein

# Run the container again
 docker start -i my-repl
```

Mount the current directory as working directory to get a project REPL.

```sh
docker run -it -v `pwd`:`pwd` -w `pwd` jehrhardt/lein
```
