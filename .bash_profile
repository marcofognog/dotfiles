[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

EDITOR=/usr/bin/vim

set_term_title(){
   echo -en "\033]0;$1\a"
}

fe() {
  local file
  local current
  current=$(cat /tmp/current_project.tmp)
  file=$(find ~ -name .git -prune -o -name .rvm -prune -o -name .rbenv\
   -prune -o -type d -o -print | fzf --query="$current" --select-1 --exit-0)
  set_term_title `basename "$file"`
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fd() {
  local dir
  dir=$(ls -d ~/*/ | fzf +m)
  echo $(basename $dir) > /tmp/current_project.tmp
  cd "$dir"
  ls
}

fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

fco() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
}

app(){
  current=$(cat /tmp/current_project.tmp)
  cd ~/$current
}

export TERM='screen-256color'
alias lock='i3lock --color=000000'
