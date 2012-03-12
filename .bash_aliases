# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dstat='dstat -cdngylm'
alias iin='sudo cp /etc/network/interfaces.isentium /etc/network/interfaces && sudo /etc/init.d/networking restart'
alias rin='sudo cp /etc/network/interfaces.reuters /etc/network/interfaces && sudo /etc/init.d/networking restart'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# emacs
alias emacs='emacs -nw'

# rspec
alias rs='rspec -fd -c --backtrace'

# clojure
alias clj='clj-env-dir'

# git
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gm='git merge'
alias gp='git pull'
alias gpo='git push origin'
alias gs='git status'
