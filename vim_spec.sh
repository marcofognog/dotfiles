result=$(vim --version  | grep "+xterm_clipboard" | wc -l)

if [ $result == "0" ]; then
  echo "VIM installation failed."
else
  echo "Successful VIM installation."
fi
