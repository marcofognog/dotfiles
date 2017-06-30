tkt() {
  echo "$(curl -iks -XPOST -d "username=$1&password=$2" $3/v1/tickets | grep "Location: " | sed 's/Location\: //' | tr -d '\r')"
}

st() {
  local ticket=$(tkt $2 $3 $4)
  echo $(curl -ksb -XPOST -d "service=$1" "$ticket")
}

target=$(cat $HOME/.cas-ticket-targets | fzf --select-1 --exit-0)
cas_service=$(echo $target | cut -d',' -f1)
cas_user=$(echo $target | cut -d',' -f2)
cas_pass=$(echo $target | cut -d',' -f3)
cas_url=https://systems-login.systemintegration.locaweb.com.br

result=$(st $cas_service $cas_user $cas_pass $cas_url)
echo $cas_service " => "  $result

