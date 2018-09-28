HOUR=$(date | cut -d ' ' -f4 | cut -d ':' -f1)
MINUTE=$(date | cut -d ' ' -f4 | cut -d ':' -f2)
TIME_NOW="$HOUR:$MINUTE"
sleep 1
xdotool type "$TIME_NOW"
