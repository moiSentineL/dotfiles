function obsrec --wraps='obs-cli --host 192.168.10.5 --port 4455 --password bruhmoment record ' --description 'alias obsrec=obs-cli --host 192.168.10.5 --port 4455 --password bruhmoment record '
  obs-cli --host 192.168.10.5 --port 4455 --password bruhmoment record  $argv
        
end
