# learn-ocaml-meetup-demo-repository

Minimal working example of a learn-ocaml source repository.

## Remark

In the running server, only the exercises that are indexed in
[src/exercises/index.json](./src/exercises/index.json) will be shown.

## How to run a server locally (using Docker and `learn-ocaml:master`)

* [Install Docker](https://github.com/coq-community/docker-coq/wiki/CLI-usage)
* Open a terminal in this folder (`cd .../learn-ocaml-meetup-demo-repository/`)
* Run `./run.sh`
* Copy the teacher token that is generated (`X-...-...-...-...`)
* Open <http://localhost:8080/> then login using your token.
* Open the `Exercises` view.
* To stop the server:
  * type <kbd>Ctrl + C</kbd> from the initial terminal,
  * or run `docker stop learn-ocaml-server` from another terminal.

## How to run a server locally (using a static binary from a release)

* Clone this repo (`git clone https://github.com/erikmd/learn-ocaml-meetup-demo-repository.git`)
* Open a terminal in this folder (`cd .../learn-ocaml-meetup-demo-repository/`)
* Run the commands below to:
  * Get the `learn-ocaml` binary from the [latest release](https://github.com/ocaml-sf/learn-ocaml/releases).
  * Get the `learn-ocaml-www.zip` archive, and unpack it.
  * Run the server.

### GNU/Linux:

```bash
mkdir server && cd server
curl -fSOL https://github.com/ocaml-sf/learn-ocaml/releases/download/v0.15.0/learn-ocaml-linux-x86_64
curl -fSOL https://github.com/ocaml-sf/learn-ocaml/releases/download/v0.15.0/learn-ocaml-www.zip
unzip learn-ocaml-www.zip
mv learn-ocaml{-linux-x86_64,}
chmod a+x learn-ocaml
./learn-ocaml --contents-dir=learn-ocaml-www --repo=../src
```

then two folders `www` and `sync` are created.

### macOS:

```bash
mkdir server && cd server
curl -fSOL https://github.com/ocaml-sf/learn-ocaml/releases/download/v0.15.0/learn-ocaml-darwin-x86_64
curl -fSOL https://github.com/ocaml-sf/learn-ocaml/releases/download/v0.15.0/learn-ocaml-www.zip
unzip learn-ocaml-www.zip
mv learn-ocaml{-darwin-x86_64,}
chmod a+x learn-ocaml
xattr -d com.apple.quarantine learn-ocaml
./learn-ocaml --contents-dir=learn-ocaml-www --repo=../src
```

then two folders `www` and `sync` are created.

### Finally:

* Copy the teacher token that is generated and shown in the logs (`X-...-...-...-...`)
* Open <http://localhost:8080/> then login using your token.
* Open the `Exercises` view.
* If need be, type <kbd>Ctrl + C</kbd> to stop the server.

## How to deploy a static server using GitHub Pages

* cf. https://ocaml-sf.org/learn-ocaml/howto-deploy-learn-ocaml-statically
