# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="mh"
# ZSH_THEME="gallois"
ZSH_THEME="tonotdo"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
    source `brew --prefix`/etc/profile.d/z.sh
    # chruby
    source /usr/local/share/chruby/chruby.sh
else
    # chruby
    source /usr/local/share/chruby/chruby.sh
    /usr/local/share/ruby-install/ruby-install.sh
	# remap caps lock to control
	setxkbmap -option ctrl:nocaps
fi

# chruby
chruby ruby-2.1.5

# vi bindings
export EDITOR='vim'
bindkey -v
export KEYTIMEOUT=1

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.bash_aliases


# terminal 256 colour support
export TERM=xterm-256color

# Android automation
export ANDROID_HOME=$HOME/src/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Applications/Appium.app/Contents/Resources/node_modules/appium/bin

# history search
bindkey "^R" history-incremental-search-backward

# python configuration
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON="$(command \which python3)"
#export VIRTUALENVWRAPPER_PYTHON="$(command \which python)"
#source /usr/local/bin/virtualenvwrapper.sh
# upgrading global installs command
# gpip install --upgrade --no-use-wheel pip3 setuptools virtualenv virtualenvwrapper
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# golang configuration
export GOPATH=$HOME/src/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Apache Spark
export SPARK_HOME=$HOME/src/spark-1.4.0-bin-hadoop2.6

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
if [[ "$unamestr" == "Darwin" ]];then
    if which jenv > /dev/null; then export PATH="$HOME/.jenv/bin:$PATH" && eval "$(jenv init -)"; fi
    export PATH="$JAVA_HOME/bin:$PATH"
    export ANDROID_HOME="$HOME/src/android-sdk-macosx/"
    export SCALA_HOME=/usr/local/bin/scala
    export PATH=$PATH:$SCALA_HOME/bin
    source "$HOME/.brew_token"
else
    [[ -s "/home/marshall/.jenv/bin/jenv-init.sh" ]] && source "/home/marshall/.jenv/bin/jenv-init.sh" && source "/home/marshall/.jenv/commands/completion.sh"
fi

#thefuck
eval "$(thefuck --alias)"
