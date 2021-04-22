#!/bin/sh

export DOTFILES_HOME=`pwd`

mv $HOME/.zshrc $HOME/.zshrc.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/zsh/.zshrc $HOME/.zshrc

mv $HOME/.profile $HOME/.profile.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc $HOME/.profile

mv $HOME/.vimrc $HOME/.vimrc.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/vim/.vimrc $HOME/.vimrc

mv $HOME/.ssh/config $HOME/.ssh/config.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/ssh/config $HOME/.ssh/config

mv $HOME/.bashrc_aliases $HOME/.bashrc_aliases.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc_aliases $HOME/.bashrc_aliases

mv $HOME/.bashrc.gcp $HOME/.bashrc.gcp.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.gcp $HOME/.bashrc.gcp

mv $HOME/.bashrc.git $HOME/.bashrc.git.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.git $HOME/.bashrc.git

mv $HOME/.bashrc.go $HOME/.bashrc.go.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.go $HOME/.bashrc.go

mv /Users/serrano/.bashrc.heroku $HOME/.bashrc.heroku.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.heroku $HOME/.bashrc.heroku

mv $HOME/.bashrc.java $HOME/.bashrc.java.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.java $HOME/.bashrc.java

mv $HOME/.bashrc.node $HOME/.bashrc.node.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.node $HOME/.bashrc.node

mv $HOME/.bashrc.perl $HOME/.bashrc.perl.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.perl $HOME/.bashrc.perl

mv $HOME/.bashrc.python $HOME/.bashrc.python.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.python $HOME/.bashrc.python

mv $HOME/.bashrc.ruby $HOME/.bashrc.ruby.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.ruby $HOME/.bashrc.ruby

mv $HOME/.bashrc.text $HOME/.bashrc.text.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.text $HOME/.bashrc.text

mv $HOME/.bashrc.todo $HOME/.bashrc.todo.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.todo $HOME/.bashrc.todo

mv $HOME/.bashrc.vagrant $HOME/.bashrc.vagrant.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/bash/.bashrc.vagrant $HOME/.bashrc.vagrant

mv $HOME/.tmux.conf $HOME/.tmux.conf.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/tmux/.tmux.conf $HOME/.tmux.conf

mv $HOME/.tigrc $HOME/.tigrc.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/tig/.tigrc $HOME/.tigrc

mv $HOME/.ssh/config $HOME/.ssh/config.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/ssh/config $HOME/.ssh/config

mv $HOME/.gitconfig $HOME/.gitconfig.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/git/.gitconfig $HOME/.gitconfig

mv /Users/serrano/.alacritty.yml /Users/serrano/.alacritty.yml.old 2>&1 >/dev/null
ln -s $DOTFILES_HOME/alacritty/.alacritty.yml /Users/serrano/.alacritty.yml

