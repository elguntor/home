# enable color support of ls and also add handy aliases
unamestr=`uname`
if [[ "$unamestr" == "Linux" ]];then
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'
	fi
elif [[ "$unamestr" == "Darwin" ]]; then
    #alias find='find .'
	alias tree='tree -C'
    export CLICOLOR=1
    export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
    alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"
fi

# catdir!
alias catdir='find . -type f -exec cat {} +'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dstat='dstat -cdngylm'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# emacs
#alias emacs='emacs -nw'
#alias em='emacsclient -t'
#alias em='emacsclient -c'

# rspec
alias rs='rspec -fd -c --backtrace'

# git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gco='git checkout'
alias gd='git diff'
alias gm='git merge'
alias gp='git pull'
alias gpf='git pull;git fetch --tags'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gs='git status'

# shh
alias sshw='ssh marshall@werewolf'
alias sshe='ssh marshall@elguntor.dyndns.org'

# find
alias fih='find -name "*.html" | xargs grep -n'
alias fij='find -name "*.java" | xargs grep -n'
alias fijs='find -name "*.js" | xargs grep -n'
alias fil='find -name "*.less" | xargs grep -n'
alias fip='find -name "*.py" | xargs grep -n'
alias fiphp='find -name "*.php" | xargs grep -n'
alias fir='find -name "*.rb" | xargs grep -n'

# netstat
alias ng='sudo netstat -pant | grep'

# redis
alias fa='echo "flushall" | redis-cli'

# postgres root
alias pgroot='psql -U postgres -W -h localhost postgres'
alias pgel='psql -U elminer -W -h localhost elminer'

# vagrant aliases
alias vd='vagrant destroy'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias vu='vagrant up'

# vim
vimit() {
	vim `find -name $1 | head -n 1`
}
alias vf=vimit

# ruby
alias be='bundle exec'
alias beg='bundle exec guard'
alias ber="bundle exec rake"
alias bers="bundle exec rake spec"
alias berc="bundle exec rails console"
alias bes="bundle exec rspec"
alias r="bundle exec rails"
alias rs="bundle exec rails s"
alias psp="rake parallel:create; rake parallel:prepare; rake parallel:spec"
alias psps="rake parallel:spec"

# python virtualenv aliases
# https://doughellmann.com/blog/2010/01/12/virtualenvwrapper-tips-and-tricks/
alias v='pyenv activate'
alias v.ld='pyenv activate levenshtein_distance'
alias v.d='pyenv deactivate'
alias v.mk='pyenv virtualenv --no-site-packages'

# django
alias pm="python manage.py"
alias pmcs="python manage.py collectstatic --noinput"
alias pmdbsh="python manage.py dbshell"
alias pmdd="python manage.py dumpdata"
alias pmld="python manage.py loaddata"
alias pmm="python manage.py migrate"
alias pmsh="python manage.py shell"
alias pmsm="python manage.py schemamigration"
alias pmsync="python manage.py syncdb --noinput"
alias pmt="python manage.py test"
alias pmrs="python manage.py runserver"

# thefuck
alias fuck='$(thefuck $(fc -ln -1))'

# react native
alias rn='react-native'
alias rna='react-native run-android'
alias rni='react-native run-ios'
alias rncc='watchman watch-del-all && rm -rf $TMPDIR/react-* && rm -rf node_modules/ && npm cache clean && npm install && npm start -- --reset-cache'
alias rnkill='kill $(lsof -t -i tcp:8081)'
alias rnjsbundle='react-native bundle --platform ios --dev false --entry-file index.js --bundle-output ./ios/release/main.jsbundle --assets-dest ./ios/release/main.jsbundle'
# before running rnadroidbundle, you must mkdir -p android/app/src/main/assets
alias rnandroidbundle='react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res'

# put this in for git logging
# git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
