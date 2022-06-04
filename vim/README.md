To install follow these commands
--------------------------------

### clone repo
* `git clone git@github.com:CrimsonTautology/dotfiles.git ~/bin/dotfiles`
* `ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc`

### set up [vim-plug](https://github.com/junegunn/vim-plug)
* `curl -fLo ~/bin/dotfiles/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
* `vim +PlugInstall +qall`
