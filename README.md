# Quandary Docker Image

This project provides a Docker dev environment that contains all of the dependencies for Quandary. The image is based on CentOS 7.9.2009 to match the univeristy's stdlinux. I created the project because I main Windows, find virtual machines annoying, need to keep compatability with stdlinux, and don't want to pollute my WSL with java.

## Prerequisites
Make sure you can get past the docker `hello-world` example before attempting this.

- [Docker](https://www.docker.com/products/docker-desktop/)

## Building the Docker Image

To build the Docker image, navigate to the directory containing the Dockerfile and run the following command:

``` bash
docker build -t stdlinux-quandary .
```

This will create a Docker image named `stdlinux-quandary`.

## Running Quandary
To run the stdlinux-quandary Docker image and mount the current directory (the directory containing the README.md file), you can use the following command:

``` bash
docker run -it --rm -v "$(pwd)":/Quandary-Public -w /Quandary-Public stdlinux-quandary
```

Here's what each part of the command does:

- `docker run`: Runs a Docker container.
- `it`: Runs the container in interactive mode and attaches a terminal to it.
- `--rm`: Removes the container when it exits.
- `v "$(pwd)":/Quandary-Public`: Mounts the current directory ($(pwd)) to the /workdir directory in the container. This is how you will be able to modify Quandary files on your local system and have them avaialable in the Quandary dev environment.
- `-w /Quandary-Public`: Sets the working directory inside the container to /Quandary-Public.
- `stdlinux-quandary`: The name of the Docker image.

## VSCode Dev Container
The main reason this fork exists. Assuming you're still in the root directory (where this readme is), run `code .`, this will load the current directory in a new instance of VSCode. Install the [VSCode Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. Press F1 to open the command pallet and choose `Dev Containers: Reopen in Container`. This will start up a linux enviornment ready to run Quandary. If successfull, the VSCode terminal will welcome you to the container and prompt you to press any key to continue. You can now continue the `quandary.pdf` documentation from "Build the sekelton interperter" from the comfort of Windows.

### Quandary-Public

See quandary.pdf for complete documentation.

