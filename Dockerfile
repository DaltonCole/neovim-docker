
FROM ubuntu:24.10

# Update packages
RUN apt-get -y update && apt-get -y upgrade
# Install neovim and dependencies
RUN apt-get install -y python3 python3-neovim git-all
#RUN apt-get install python-dev
#RUN apt-get install python-pip
#RUN apt-get install python3-dev
#RUN apt-get install python3-pip
RUN curl -sL install-node.vercel.app/lts | bash # nodejs - coc requirement
RUN apt-get install -y nodejs npm
#RUN apt install -y npm
RUN apt-get install -y curl

# Add a user
ARG UNAME=docker
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
ENV HOME /home/${UNAME}

# Set the working directory
#WORKDIR /neovim

# --- Plugins --- #
# Install Plug
RUN curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Copy config file
COPY --chown=${UID}:${GID} init.vim ${HOME}/.config/nvim/
# Install plugins
RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +'CocInstall -sync coc-html coc-sh coc-rust-analyzer coc-pyright coc-markdown coc-json coc-clangd ' +qall
# Plugin setup
RUN mkdir -p ${HOME}/.config/nvim/other


CMD ["bash"]
