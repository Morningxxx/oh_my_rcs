# /bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mv ./.zshrc ~/
mv ./.vimrc ~/

brew install git wget tig mysql mongodb python2 vim
cd ./ && wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm get-pip.py
pip install --upgrade pip
pip install -r ./requirement.txt --user
/bin/bash ./vimsetup.sh
source ~/.vimrc

