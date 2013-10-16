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
alias em='emacs -nw'

# rspec
alias rs='rspec -fd -c --backtrace'

# git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
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
alias fih='find -name "*.html" | xargs grep -n'
alias fij='find -name "*.java" | xargs grep -n'
alias fijs='find -name "*.js" | xargs grep -n'
alias fir='find -name "*.rb" | xargs grep -n'
alias fip='find -name "*.py" | xargs grep -n'
alias fil='find -name "*.less" | xargs grep -n'

# netstat
alias ng='sudo netstat -pant | grep'

# redis
alias fa='echo "flushall" | redis-cli'

# moving
alias cdbi='cd $BUNCH_HOME/bunch-ios'
alias cdbw='cd $BUNCH_HOME/bunch-web/bunch'
alias cdbn='cd $BUNCH_HOME/bunch-nagios'
alias cdel='cd $BUNCH_HOME/elscrum'

# postgres root
alias pgroot='psql -U postgres -W -h localhost postgres'
alias pgel='psql -U elscrum -W -h localhost elscrum'

# activate python
alias ap='source $HOME/Dropbox/src/python-django/bin/activate'

# current project
alias cdcp='cd $HOME/src/elscrum'
alias runs='bin/django runserver 0.0.0.0:8000'
alias elrun='./manage.py runserver 0.0.0.0:8000'
#alias cov='google-chrome coverage/index.html'

# vim
vimit() {
	vim `find -name $1`
}
alias vf=vimit
# put this in for git logging
# git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
