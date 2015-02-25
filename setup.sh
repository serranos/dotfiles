#!/bin/sh

export DOTFILES_HOME=`pwd`

mv $HOME/.profile $HOME/.profile.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc $HOME/.profile

mv $HOME/.vimrc $HOME/.vimrc.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/vim/.vimrc $HOME/.vimrc

mv $HOME/.bashrc.git $HOME/.bashrc.git.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.git $HOME/.bashrc.git

mv $HOME/.bashrc.python $HOME/.bashrc.python.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.python $HOME/.bashrc.python

mv $HOME/.tmux.conf $HOME/.tmux.conf.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/tmux/.tmux.conf $HOME/.tmux.conf
