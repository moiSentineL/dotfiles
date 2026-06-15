function yt --description 'download youtube stuff using aria2c'
  yt-dlp \
  #--user-agent "com.google.android.youtube/18.11.34 (Linux; U; Android 11)" \
  #--add-header "Accept-Language: en-US,en;q=0.9" \
  # --extractor-args "youtube:player_client=tv" \
  --sleep-requests 1 \
  -f "bestvideo[vcodec!*=av01][vcodec!*=vp9][vcodec!*=vp09]+bestaudio[ext=opus]/bestvideo[vcodec!*=av01][vcodec!*=vp9]+bestaudio/bestvideo+bestaudio" \
  -o "%(title)s.%(ext)s" \
  --merge-output-format mp4 \
  --write-auto-sub \
  --embed-subs \
  --embed-chapters \
  --sub-lang en \
  --concurrent-fragments 1 \
  --external-downloader aria2c \
  --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 2M --file-allocation=none" \
  $argv

end
