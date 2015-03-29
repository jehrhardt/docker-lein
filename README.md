Docker container to run leinigen.

# Usage
Run a Clojure REPL

```sh
docker run -it devstage/lein
```

Mount the local Maven repository into the container to prevent downloading
dependencies on each container start

```sh
docker run -it -v $HOME/.m2/repository:/maven-repo devstage/lein
```

Run a headless REPL and make it available under port 8080

```sh
docker run -it -v $HOME/.m2/repository:/maven-repo -p 8080:47480 devstage/lein repl :headless
```

Mount the current directory as working directory

```sh
docker run -it -v $HOME/.m2/repository:/maven-repo -v $PWD:/project devstage/lein
```
