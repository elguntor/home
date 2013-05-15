# enable color support of ls and also add handy aliases
unamestr=`uname`
if [[ "$unamestr" == "Linux" ]];then
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
	fi
elif [[ "$unamestr" == "Darwin" ]]; then
	alias ls='ls -G'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dstat='dstat -cdngylm'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# emacs
alias emacs='emacs -nw'

# rspec
alias rs='rspec -fd -c --backtrace'

# git
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gm='git merge'
alias gp='git pull'
alias gpf='git pull;git fetch --tags'
alias gpo='git push origin'
alias gs='git status'

# shh
alias sshh='ssh marshall@hawk'
alias sshw='ssh marshall@werewolf'
alias sshe='ssh marshall@elguntor.dyndns.org'

# find
alias fir='find -name "*.rb" | xargs grep'
alias fij='find -name "*.java" | xargs grep'
alias fip='find -name "*.py" | xargs grep'

# netstat
alias ng='sudo netstat -pant | grep'

# redis
alias fa='echo "flushall" | redis-cli'

# moving
alias cdbi='cd $BUNCH_HOME/bunch-ios'
alias cdbw='cd $BUNCH_HOME/bunch-web'

# postgres root
alias pgroot='psql -U postgres -w -h localhost postgres'

# activate python
alias ap='source $HOME/Dropbox/src/python-django/bin/activate'

# current project
alias cdcp='cd $HOME/Dropbox/src/mysite'
alias mr='./manage.py runserver'
alias rs='./bin/django runserver'
#alias cov='google-chrome coverage/index.html'

# put this in for git logging
# git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
