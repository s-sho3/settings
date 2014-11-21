autoload -Uz compinit
compinit

setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups

setopt correct

export LANG=ja_JP.UTF-8
setopt print_eight_bit
setopt no_flow_control

# bindkey -v
bindkey -e

export EDITOR=vim

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

setopt extendedglob

export PATH=/usr/local/Cellar/ruby/2.0.0-p247/lib/ruby/gems/2.0.0/gems/railties-4.0.1/bin:"${PATH}":${GEM_HOME}/bin
#export GTEST_DIR=~/gtest-1.6.0
export GOROOT="/usr/local/go"
export GOPATH="~/programming/go"
export PATH=$PATH:$GOPATH/bin

PROMPT="%D{%T} %n@%m%{${fg[yellow]}%}[%~]%{${reset_color}%}
%% "
SPROMPT="%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f' 

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-search-forward

setopt list_packed #ls with less space

setopt no_beep

setopt noautoremoveslash

function chpwd() { ls } #change directory then ls

setopt complete_aliases #completion for file and directory

if which rbenv > /dev/null 2>&1 ; then
  eval "$(rbenv init -)"
fi

alias -g L='| less'
alias -g G='| grep'

alias grep='grep --color=auto'
alias gp='grep -i'

case ${OSTYPE} in
  darwin*)
    export LSCOLORS="dxfxexdxbxegedabagacdx"
    alias ls='ls -G -F'
    ;;
  *)
    export LS_COLORS="di=33:ln=01;36:ex=01;32:"
    alias ls='ls -F --color=auto'
    ;;
esac
alias la='ls -a'
alias ll='ls -l'

alias less='less -S'
#alias less='less -N'
alias le='less'

alias mkdir='mkdir -p'

alias df='df -h'

alias st='svn st'
alias sk='st | grep K'
alias sl='svn log | less'
alias sp='svn up'
alias sd='svn diff'

export GIT_PAGER="lv -c"
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gp='git pull'

alias pr='cd ~/programming'

alias -s html=firefox

function runc () {
  gcc $1
  shift
  ./a.out $@
}
alias -s c='runc'

function runcpp () {
  g++ $1
  shift
  ./a.out $@
}
alias -s cpp='runcpp'
