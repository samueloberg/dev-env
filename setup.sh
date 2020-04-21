git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mv ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc

vim +PluginInstall +qall
