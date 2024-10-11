# neovim-docker


## Getting started

* To build: `docker build -t neovim --build-arg UID=$(id -u) --build-arg GID=$(id -g) .`

* To run:
    *  `docker run --rm -v /home/drc/Desktop/docker/neovim-docker:/drc -it neovim`
        * `-v`: Volume
