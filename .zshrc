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

# golang configuration
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
    # homebrew
    source `brew --prefix`/etc/profile.d/z.sh
    export PATH=/usr/local/sbin:$PATH
    source "$HOME/.brew_token"

    # chruby
    source /usr/local/share/chruby/chruby.sh
    chruby ruby-2.1.5
else
    # chruby
    source /usr/local/share/chruby/chruby.sh
    /usr/local/share/ruby-install/ruby-install.sh
	# remap caps lock to control
	setxkbmap -option ctrl:nocaps
fi

# Android automation
if [[ "$unamestr" == "Darwin" ]];then
    export ANDROID_HOME=$HOME/src/android-sdk-macosx
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:/Applications/Appium.app/Contents/Resources/node_modules/appium/bin
fi

if [[ "$unamestr" == "Darwin" ]];then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
else
    [ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
    export VIRTUALENVWRAPPER_PYTHON="$(command \which python)"
fi

# golang configuration
if [[ "$unamestr" == "Darwin" ]];then
    export GOROOT=/usr/local/opt/go/libexec
fi

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
if [[ "$unamestr" == "Darwin" ]];then
    # jenv
    if which jenv > /dev/null; then export PATH="$HOME/.jenv/bin:$PATH" && eval "$(jenv init -)"; fi
    export PATH="$JAVA_HOME/bin:$PATH"

    # scala
    export SCALA_HOME=/usr/local/bin/scala
    export PATH=$PATH:$SCALA_HOME/bin

    # thefuck
    eval "$(thefuck --alias)"
else
    # jenv
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    # maven
    export M2_HOME="/usr/local/apache-maven-3.3.3"
    export PATH="$M2_HOME/bin:$PATH"

    # jdk
    export JDK_HOME="/usr/local/jdk1.7.0_79"
fi
