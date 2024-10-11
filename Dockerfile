
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
RUN apt-get install -y nodejs
RUN apt-get install -y curl

# Add a user
#RUN useradd -m drc
#USER drc

# Set the working directory
#WORKDIR /neovim

# Plugins
RUN curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY init.vim /root/.config/nvim/
RUN nvim --headless +PlugInstall +qall
RUN mkdir -p /root/.config/nvim/other
RUN apt install -y npm
RUN nvim --headless +'CocInstall -sync coc-html coc-sh coc-rust-analyzer coc-pyright coc-markdown coc-json coc-clangd ' +qall
#RUN nvim --headless +"CocInstall -sync coc-pyright" +qall
#RUN nvim --headless +'CocInstall coc-pyright coc-python' +qall


# Config file

CMD ["bash"]
