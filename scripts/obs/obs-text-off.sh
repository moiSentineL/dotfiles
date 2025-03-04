PW="bruhmoment"
PORT=4455

~/.dotfiles/scripts/obs/log.sh reset;
obs-cli --host $OBS_HOST --port $PORT --password $PW scene switch camera
