--------------------------------------------------------------------------------
# install nvm/node (WSL/Ubuntu)
https://github.com/nvm-sh/nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts

## add to .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## verify install
command -v nvm
npm --version
node --version

## list installed/available versions of node
nvm ls
nvm ls-remote

## use specific versions of node
nvm use node
nvm use --lts
nvm use v8.2.1

--------------------------------------------------------------------------------