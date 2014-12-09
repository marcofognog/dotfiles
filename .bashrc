#!/usr/bin/env bash

function setup_ps1 {
  local path="\w"
  local newline="\n"
  local user="\u"
  local host="\h"

  function ruby_version {
    ruby -e "print RUBY_VERSION"
  }

  local user_at_host="$user$txtred@$hiblu$host"
  local path="$path"
  local final="$"

  PS1=""
  PS1+=$user_at_host
  PS1+=$path-
  PS1+=ruby-$(ruby_version)
  PS1+=$newline
  PS1+=$final
  PS1+=$clroff
}

alias ls="ls -h --color=auto"

setup_ps1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
