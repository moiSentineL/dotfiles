HOST=192.168.10.6
PW="bruhmoment"
PORT=4455

obs-cli --host $HOST --port $PORT --password $PW item hide break
obs-cli --host $HOST --port $PORT --password $PW item show study
obs-cli --host $HOST --port $PORT --password $PW item toggle work
obs-cli --host $HOST --port $PORT --password $PW item toggle notif
