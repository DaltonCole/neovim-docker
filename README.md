# neovim-docker

## Getting started

* To build: `docker build -t neovim --build-arg UID=$(id -u) --build-arg GID=$(id -g) .`
    * This will create a docker container with the `neovim` tag

* To run:
    *  `docker run --rm -v /:/system -it neovim nvim /system/<FILE>`
    * See the .bashrc section for an easier way to run

## .bashrc

* It is recommended to add the following to your `.bashrc` file:

```
# Docker alias
neovim() {
    VOL=/system
    CD_DIR=/${VOL}/$(pwd)
    VIM_DIR=/${VOL}/$(readlink -f $1)
    docker run --rm -v /:/${VOL} -it neovim "cd ${CD_DIR} && nvim ${VIM_DIR}"
}
alias n="neovim"
alias vim="neovim"
alias nvim="neovim"
alias vi="neovim"
```
