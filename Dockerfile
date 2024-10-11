FROM ubuntu:24.10

# --- Package Installation --- #
# Update packages
RUN apt-get -y update && apt-get -y upgrade
# Install neovim and dependencies
RUN curl -sL install-node.vercel.app/lts | bash # nodejs - coc requirement
RUN apt-get install -y python3 python3-neovim git-all nodejs npm curl

# --- Add a user --- #
ARG UNAME=docker
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
ENV HOME /home/${UNAME}

# --- Plugins --- #
# Install Plug
RUN curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Copy plugins config file
COPY --chown=${UID}:${GID} plugins.vim ${HOME}/.config/nvim/init.vim
# Install plugins
RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +'CocInstall -sync coc-html coc-sh coc-rust-analyzer coc-pyright coc-markdown coc-json coc-clangd ' +qall
# Plugin setup
RUN mkdir -p ${HOME}/.config/nvim/other
# Copy normal config file
COPY --chown=${UID}:${GID} configs.vim ${HOME}/.config/nvim/
RUN cat ${HOME}/.config/nvim/configs.vim >> ${HOME}/.config/nvim/init.vim && rm ${HOME}/.config/nvim/configs.vim

# Use bash as the entrypoint. Will require adding nvim as an argument
#   This is given to add more flexibility when running the container
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
