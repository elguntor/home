# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# vi bash
set -o vi

# gpg tty
export GPG_TTY=`tty`

# terminal 256 colour support
TERM=xterm-256color

# Mac OSX - z
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
	#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib
    source /usr/local/Cellar/z/1.8/etc/profile.d/z.sh
else
	# remap caps lock to control
	setxkbmap -option ctrl:nocaps
fi

# Java
export JAVA_HOME="/usr/local/jdk1.7.0_45"
export ANT_HOME="/usr/local/apache-ant-1.9.3"
export M2_HOME="/usr/local/apache-maven-3.1.1"
export M2="$M2_HOME/bin"
export PATH="$JAVA_HOME/bin:$M2:$ANT_HOME/bin:$PATH"
export ANDROID_HOME="/Users/marshall/src/android-sdks/"
# PS1
# Git branch in prompt.
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \[\e[0;36m\]\$(parse_git_branch) \$\[\033[00m\] "

# python virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# chruby
if [[ "$unamestr" == "Darwin" ]];then
    source /usr/local/share/chruby/chruby.sh
else
    source /usr/local/share/chruby/chruby.sh
    /usr/local/share/ruby-install/ruby-install.sh
fi
chruby ruby-2.1.3

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
if [[ "$unamestr" == "Darwin" ]];then
    export PATH="$HOME/.jenv/bin:$PATH"
    if which jenv > /dev/null; then eval "$(jenv init -)"; fi
else
    [[ -s "/home/marshall/.jenv/bin/jenv-init.sh" ]] && source "/home/marshall/.jenv/bin/jenv-init.sh" && source "/home/marshall/.jenv/commands/completion.sh"
fi
