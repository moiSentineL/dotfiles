function taskupg --wraps='scp ~/creation/obs/tasks.txt nibir@192.168.10.5:/home/nibir/obs/.' --description 'alias taskupg=scp ~/creation/obs/tasks.txt nibir@192.168.10.5:/home/nibir/obs/.'
  scp ~/creation/obs/tasks.txt nibir@192.168.10.5:/home/nibir/obs/. $argv
        
end
