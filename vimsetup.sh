# /bin/bash

#setup theme
cd ~
mkdir .vim 
cd .vim
mkdir colors 
cd colors
pwd

git clone https://github.com/tomasr/molokai.git
cp molokai/colors/molokai.vim ~/.vim/colors/
rm -rf molokai

cd ~/.vim/color
git clone https://github.com/YorickPeterse/happy_hacking.vim.git
cp happy_hacking.vim/colors/happy_hacking.vim ~/.vim/colors/
rm -rf happy_hacking.vim

cd ~/.vim/color
git clone https://github.com/danilo-augusto/vim-afterglow.git
cp vim-afterglow/colors/afterglow.vim  ~/.vim/colors/
rm -rf vim-afterglow

# setup powerline
pip install powerline-status

. /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh

echo << EOF >> ~/.bashrc
. /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh
EOF

echo << EOF >> ~/.zshrc
. /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh
EOF

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
rm -rf fonts

# install plugin for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# syntastic
cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

# supertab
cd ~/.vim/bundle
pwd
git clone https://github.com/ervandew/supertab.git

# vim-fugitive
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c 

# indentLine
git clone https://github.com/Yggdroot/indentLine.git

# jedi-vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git
