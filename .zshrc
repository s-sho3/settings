#TODO:better color settings
##http://news.mynavi.jp/column/zsh/009/index.html

eval "$(rbenv init -)"

#for completion
autoload -U compinit
compinit

#colored completion
zstyle ':completion:*' list-colors ''

#predict completion
autoload predict-on
predict-on
#no predict in edit commndline<--because completion override input
zstyle ':predict' toggle true

#set LOCALE
export LANG=ja_JP.UTF-8

#show info at terminal title bar
case "${TERM}" in
kterm*|xterm)
  precmd(){
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  ;;
esac

#prompt
case ${UID} in
#0) #for root
#  PROMPT="%B%{ [33m%}%/#%{ [m%}%b "
#  PROMPT2="%B%{ [33m%}{_#%{ [m%}%b "
#  SPROMPT="%B%{ [33m%}%r is correct? [n,y,a,e]:%{ [m%}%b "
#  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#    PROMPT="%{ [37m%}${HOST%%.*} ${PROMPT}"
# ;;
*) #for ordinary users
#  RPROMPT="[%~]"
  PROMPT="%D{%T} %n@%m%{${fg[yellow]}%}[%~]%{${reset_color}%}
%% " #%m is server name, %n is user name, ${fg[color]}%} changes color. 
  PROMPT2="%{${fg[yellow]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  # PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

#Emacs keybind
#bindkey -e
#vi keybind
bindkey -v
bindkey "^J" vi-cmd-mode

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups #ignore duplication commnad history list
setopt share_history

#history of directory
setopt auto_pushd
setopt pushd_ignore_dups

setopt extendedglob

#fix typo
setopt correct

#change directory without cd
setopt auto_cd

#ls with less space
setopt list_packed

#mute for complition
setopt nolistbeep

setopt noautoremoveslash

#change directory with ls
function chpwd() { ls }

export LS_COLORS="di=01;36"

#completion for file and directory
setopt complete_aliases

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gp='grep -i'

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lc='ls *.c'
alias lh='ls *.h'

alias less='less -S'
#alias less='less -N'
alias le='less'

alias df='df -h'

alias st='svn st'
alias sk='st | grep K'
alias sl='svn log | less'
alias sp='svn up'
alias sd='svn diff'

export GIT_PAGER="lv -c"
alias g='git'
alias ga='git add'
#alias gc='git commit -a'
alias gc='git ci'
alias gs='git st'

#alias ho='cd ~/hoge'

#export GEM_HOME=~/mygemrepository
#export PATH="${PATH}":${GEM_HOME}/bin
#export GTEST_DIR=~/gtest-1.6.0
export EDITOR=vim

#alias -s zip=zipinfo
#alias -s tgz=gzcat
#alias -s gz=gzcat
#alias -s tbz=bzcat
#alias -s bz2=bzcat

alias -s java=lv
alias -s c=lv
alias -s cpp=lv
alias -s cxx=lv
alias -s h=lv
alias -s C=lv
#alias -s sh=lv
alias -s txt=lv
alias -s xml=lv

#alias -s html=firefox
#alias -s xhtml=firefox

#alias -s gif=display
#alias -s jpg=display
#alias -s jpeg=display
#alias -s png=display
#alias -s bmp=display

#alias -s mp3=amarok
#alias -s m4a=amarok
#alias -s ogg=amarok

#alias -s mpg=svlc
#alias -s mpeg=svlc
#alias -s avi=svlc
#alias -s mp4v=svlc

