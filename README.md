# What is it?

This is a Dockerfile + a set of wrapper scripts that provide the
[linearo](https://www.linaro.org/) ARM toolchain as in a Docker container.

# Installation

Either clone the git repository or download and unpack a tarball from
the [releases](https://github.com/DirtyHairy/docker-linearo/releases) page.
Create a directory that should contain the symlinks to the various executable
toolchain components (and make sure that it is in your path when you try to
use the toolchain).

After this, run the included `install.sh` script from the project directory
and point it to the target directory

    $ ./install.sh /path/to/target/directory

This will pull the image from the Docker Hub and create a set of symlinks
that point to the provided wrapper script. After that, you're done: the
links can be used just like their respective native counterparts.

Needless to say, you need [Docker](https://www.docker.com/) installed in order
to use this image. On Linux, Docker should be available from your package
manager; on MacOS, you can download Docker for Mac or install it via Homebrew.

# Usage

The symlinks created by the installer can be used as drop-in replacements for
the tools provided by the toolchain:

    $ arm-eabi-gcc
    arm-eabi-gcc: fatal error: no input files
    compilation terminated.

# Limitations

The wrapper script mounts the current working directory into the docker
container. Therefore, all source files must reside below the current working
directory.

# License

The files in this repository are licensed under the terms and conditions of
the MIT license.
