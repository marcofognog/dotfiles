fe() {
  local file
  local current
  tempfile=/tmp/current_project.tmp
  touch $tempfile
  current=$(cat $tempfile)/
  file=$(find ~/"$current" -name .git -prune -o -name .rvm -prune -o -name .rbenv\
    -prune -o -type d -o -print | fzf --select-1 --exit-0)
  set_term_title `basename "$file"`
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fp() {
  local dir
  namespace=projetos
  dir=$(ls -d ~/$namespace/* | fzf +m)
  echo $namespace/$(basename $dir) > /tmp/current_project.tmp
  cd "$dir"
  ls --color -a
}

fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
  cd "$dir"
  ls --color -a
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

p(){
  if [ "$1" != "" ] ; then
    cd $1
    echo projetos/$(basename $(pwd)) > /tmp/current_project.tmp
  else
    current=$(cat /tmp/current_project.tmp)
    cd ~/$current
  fi
}