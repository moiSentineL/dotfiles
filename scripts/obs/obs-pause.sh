HOST=192.168.10.6
PW="bruhmoment"
PORT=4455

obs-cli --host $HOST --port $PORT --password $PW item hide study
obs-cli --host $HOST --port $PORT --password $PW item show break
obs-cli --host $HOST --port $PORT --password $PW item toggle pause
obs-cli --host $HOST --port $PORT --password $PW item toggle pause
