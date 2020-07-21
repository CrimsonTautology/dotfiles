To install follow these commands
--------------------------------

### clone repo
* `git clone git@github.com:CrimsonTautology/dotvim.git ~/.vim`

### set up [Vundle](https://github.com/VundleVim/Vundle.vim)
* `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* `vim +PluginInstall +qall`

### setup [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
* `cd ~/.vim/bundle/YouCompleteMe`
* `sudo apt install build-essential cmake vim python3-dev`
* `python3 install.py`
