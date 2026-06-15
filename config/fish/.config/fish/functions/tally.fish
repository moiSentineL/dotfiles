function tally
  set file = "/home/nibir/tally.log"

  set bruh = $(cat $file)

  set no-bruh = bruh + 1

  no-bruh > "/home/nibir/tally.log"
end

