# Quandary Docker Image

This project provides a Docker dev environment that contains all the dependencies for Quandary. The image is based on Hedhat 8 to mimic the university's stdlinux. I created the project because I mainly use Windows, find virtual machines annoying, need to maintain compatibility with stdlinux, and don't want to install Java.

## Prerequisites
Make sure you can get past the Docker `hello-world` example before attempting this.

- [Docker](https://www.docker.com/products/docker-desktop/)

## Building the Docker Image

To build the Docker image, navigate to the directory containing the Dockerfile and run the following command:

```bash
docker build -t stdlinux-quandary .
```

This will create a Docker image named `stdlinux-quandary`.

## Running Quandary
To run the stdlinux-quandary Docker image and mount the current directory (the directory containing the README.md file), you can use the following command:

```bash
docker run -it --rm -v "$(pwd)":/Quandary-Public -w /Quandary-Public stdlinux-quandary
```

Here's what each part of the command does:

- `docker run`: Runs a Docker container.
- `-it`: Runs the container in interactive mode and attaches a terminal to it.
- `--rm`: Removes the container when it exits.
- `-v "$(pwd)":/Quandary-Public`: Mounts the current directory ($(pwd)) to the /workdir directory in the container. This is how you will be able to modify Quandary files on your local system and have them available in the Quandary dev environment.
- `-w /Quandary-Public`: Sets the working directory inside the container to /Quandary-Public.
- `stdlinux-quandary`: The name of the Docker image.

## VSCode Dev Container
The main reason this fork exists. Assuming you're still in the root directory (where this readme is), run `code .`, this will load the current directory in a new instance of VSCode. Install the [VSCode Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. Press F1 to open the command pallet and choose `Dev Containers: Rebuild and open in Container`. This will start up an Linux environment ready to run Quandary. If successful, the VSCode terminal will welcome you to the container and prompt you to press any key to continue. Dev Containers will install the VSCode Java extensions into the container in the background. You can now continue the `quandary.pdf` documentation from *Build the skeleton interpreter*.

> Protip: The hotkey to open the terminal is `ctrl+~'.

### Dev Container Setup
There are two files that configure intellisense and linting for the project, `.vscode/settings.json` and `.devcontainer/devcontainer.json`. We're on our own for `.cup`, `.fjelx`, and `.q` files, but we can at least get it for `.java` files. `Lexer.java` and `Parser.java` are emitting unsuppressed warnings; I'm leaving it alone until I learn these are okay to suppress.

### Quandary-Public

See `quandary.pdf` for complete documentation.