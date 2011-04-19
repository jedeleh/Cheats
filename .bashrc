# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set up higher java memory stuffses.
JAVA_OPTS='-Xms768m -Xmx1536m -XX:MaxPermSize=256m -server'

# User specific aliases and functions
export SPIKE_PROJECT='/home/webpath/spike'
export TRUNK_PROJECT='/home/webpath/maintenance'
export QUICK_PROJECT='/home/webpath/quick'
export PERMISSIONS_PROJECT='/home/webpath/permissions'
alias spike='export PROJECT=$SPIKE_PROJECT'
alias trunk='export PROJECT=$TRUNK_PROJECT'
alias permissions='export PROJECT=$PERMISSIONS_PROJECT'
alias quick='export PROJECT=$QUICK_PROJECT'
export PROJECT='$TRUNK_PROJECT'
export PROJECT='/home/webpath/maintenance'
alias go='echo $PROJECT;cd $PROJECT'
#alias go='cd ~/projects/maintenance'
alias go:spec='cd $PROJECT/spec'
alias go:spec:models='cd $PROJECT/spec/models'
alias go:spec:views='cd $PROJECT/spec/views'
alias go:db='cd $PROJECT/db'
alias go:migrate='cd $PROJECT/db/migrate'
alias go:app='cd $PROJECT/app'
alias go:models='cd $PROJECT/app/models'
alias go:controller='cd $PROJECT/app/controllers'
alias go:views='cd $PROJECT/app/views'
alias ls='ls -hF --color=tty'
alias grep='grep --color'
alias vim='gvim'
alias myfind='find . -name "*rb" | xargs egrep'
alias vm:off='set +o vi'
alias vm:on='set -o vi'
alias cvs='svn'
alias stat="svn stat | grep -v \.swp"
alias sql="rlwrap sqlite3 db/development.sqlite3"
alias sdiff='svn diff -x-b | vi -'

set -o vi
export VISUAL=vim

function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }


NORMAL="\[\033[0m\]"
WHITE="\[\033[0;37;38m\]"
CYAN="\[\033[0;36;36m\]"
BRIGHTBLUE="\[\033[1;34;38m\]"
BRIGHTWHITE="\[\033[1;37;38m\]"
BRIGHTCYAN="\[\033[1;36;36m\]"
BRIGHTMAGENTA="\[\033[1;35;40m\]"
RED="\033[0;31;40m\]"
GRAPE="\033[0;35;40m\]"
LIME="\033[1;32;40m\]"


NAME="jkaplan"
P1="$CYAN$SYM$BRIGHTCYAN-$BRIGHTBLUE($BRIGHTBLUE\u$CYAN$BRIGHTBLUE"
P2="$BRIGHTBLUE)$BRIGHTCYAN-$BRIGHTBLUE($BRIGHTBLUE\w$BRIGHTBLUE"
P3=")$BRIGHTCYAN-$CYAN$SYM$NORMAL\n$CYAN$SYM$BRIGHTCYAN-"
P4="$BRIGHTBLUE($BRIGHTBLUE\$?$BRIGHTBLUE)$CYAN>$NORMAL "
PS1="$P1$P2$P3$P4"

repeat() {
  count=$1;
  shift;
  current=0;
  while ((current < count));do
    "$@";
    let current=current+1;
  done
}

cuke() {
  count=$1;
  shift;
  current=0;
  while ((current < count));do
    eval "/home/webpath/.rvm/gems/ruby-1.9.2-p136@webpath/bin/cucumber /home/webpath/maintenance/features/$1 -n$2";
    let current=current+1;
  done

}



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


