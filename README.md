# neovim-docker


## Getting started

* To build: `docker build -t neovim .`

* To run:
    *  `docker run --rm -v /home/drc/Desktop/docker/neovim-docker:/drc -u $(id -u):$(id -g) -it neovim`
        * `-v`: Volume
        * `-u`: Set user id to be the same as the running user
