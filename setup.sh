#!/bin/sh

export DOTFILES_HOME=`pwd`

mv $HOME/.profile $HOME/.profile.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc $HOME/.profile

mv $HOME/.vimrc $HOME/.vimrc.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/vim/.vimrc $HOME/.vimrc

mv $HOME/.ssh/config $HOME/.ssh/config.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/ssh/config $HOME/.ssh/config

mv $HOME/.bashrc.git $HOME/.bashrc.git.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.git $HOME/.bashrc.git

mv $HOME/.bashrc.python $HOME/.bashrc.python.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.python $HOME/.bashrc.python

mv $HOME/.bashrc.perl $HOME/.bashrc.perl.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.perl $HOME/.bashrc.perl

mv $HOME/.bashrc.ruby $HOME/.bashrc.ruby.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.ruby $HOME/.bashrc.ruby

mv $HOME/.tmux.conf $HOME/.tmux.conf.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/tmux/.tmux.conf $HOME/.tmux.conf

mv $HOME/.ssh/config $HOME/.ssh/config.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/ssh/config $HOME/.ssh/config
