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

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# clojure
export CLOJURE_OPTS="-server"

# leiningen
export PATH="$PATH:/usr/local/leiningen/bin"

# stokgrok
export STOKGROK_HOME="$HOME/src/stokgrok"
export NLP_HOME="$STOKGROK_HOME/nlp"

# intellij
export PATH="$PATH:/usr/local/idea-IC-111.277/bin/"

# go -- might not need these yet
export GOROOT="/usr/local/go"
export GOBIN="$GOROOT/bin"
export GOARCH="amd64"
export GOOS="linux"
export PATH="$PATH:$GOBIN"

# storm
export STORM_HOME="/usr/local/storm-0.8.2"
export PATH="$PATH:$STORM_HOME/bin"

# vi bash
set -o vi

# gpg tty
export GPG_TTY=`tty`

# MySQL prompt
#export MYSQL_PS1=":\\d@\\h> "

# creating a C REPL
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="clang -xc '-' $go_libs $go_flags"

# Using the C REPL...use a here document
# go_c << '---'
# int main(){printf("Hello\n");}
# ---
# ./a.out

# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
	export PATH=$PATH:/usr/local/mysql/bin
	export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib
fi

# RVM
[[ -s "/home/marshall/.rvm/scripts/rvm" ]] && source "/home/marshall/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
