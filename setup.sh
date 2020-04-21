git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mv ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc

brew install cmake macvim python
brew install mono go nodejs
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

vim +PluginInstall +qall
