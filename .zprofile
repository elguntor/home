#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /sbin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# history search
bindkey "^R" history-incremental-search-backward

# rbenv
eval "$(rbenv init -)"

# jenv and java
if which jenv > /dev/null; then export PATH="$HOME/.jenv/bin:$PATH" && eval "$(jenv init -)"; fi
export PATH="$JAVA_HOME/bin:$PATH"

# include a file if it exists
include () {
    [[ -f "$1" ]] && source "$1"
}

# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
    # homebrew
    include `brew --prefix`/etc/profile.d/z.sh
    source "$HOME/.brew_token"

    # Android automation
    export ANDROID_HOME=/Users/marshall/Library/Android/sdk

    # pyenv
    type pyenv &> /dev/null
    if [ $? -eq 0 ]; then
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi

    # nvm
    export NVM_DIR="$HOME/.nvm"
    source $(brew --prefix nvm)/nvm.sh
else
    # Android automation
    export ANDROID_HOME=$HOME/Android/Sdk
    export PATH="$PATH:$ANDROID_HOME/platform-tools"

	# remap caps lock to control
	setxkbmap -option ctrl:nocaps

    # python
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
