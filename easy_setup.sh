# /bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mv ./.zshrc ~/
mv ./.vimrc ~/

brew install git wget tig mysql mongodb python2 python3 npm vim thefuck
cd ./ && wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm get-pip.py
pip install --upgrade pip
pip install -r ./requirement.txt --user
/bin/bash ./vimsetup.sh

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.zshrc

