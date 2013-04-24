To install follow these commands
--------------------------------


cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update

To install a new submodule...
-----------------------------
git submodule add `repository_url` bundle/`plugin_folder`
git add .
git commit

To update all
-------------
git submodule foreach git pull origin master
