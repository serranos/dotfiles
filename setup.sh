#!/bin/sh

export DOTFILES_HOME=`pwd`
ln -s $DOTFILES_HOME/bash/.bashrc $HOME/.profile
ln -s $DOTFILES_HOME/bash/.bashrc.git $HOME/.bashrc.git
ln -s $DOTFILES_HOME/bash/.bashrc.python $HOME/.bashrc.python
ln -s $DOTFILES_HOME/tmux/.tmux.conf $HOME/.tmux.conf
