# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# set the right keyboard layout, since Ubuntu keeps forgeting it
setxkbmap br

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PATH=$PATH:/opt/android-sdk-linux/platform-tools/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.fzf.bash

EDITOR=/usr/local/bin/vim

# Load urxvt config
xrdb ~/.Xresources

set_term_title(){
  echo -en "\033]0;$1\a"
}

source $HOME/.bashrc.d/functions.sh

export TERM='screen-256color'
alias lock='i3lock --color=000000'

function setup_ps1 {
local path="\w"
local newline="\n"
local user="\u"
local host="\h"

local user_at_host="$user$txtred@$hiblu$host"
local path="$path"
local final="$"

PS1="\[\e[0;32m\]"
PS1+=$user_at_host
PS1+=$path
PS1+=$newline
PS1+=$final
PS1+="\[\e[0m\]"
}

nib(){
  ssh -i ~/.ssh/sysint_custom _manogueira@nibbler0001.linux.locaweb.com.br
}

alias ls="ls -h --color=auto"

setup_ps1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias open='xdg-open'
alias ber='bundle exec rspec'

xmodmap ~/.Xmodmap
