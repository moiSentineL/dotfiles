function yt --description 'download youtube stuff using aria2c'
  # yt-dlp --user-agent "com.google.android.youtube/18.11.34 (Linux; U; Android 11)" --add-header "Accept-Language: en-US,en;q=0.9" --extractor-args "youtube:player_client=android" -f "bv[vcodec^=avc]+ba/b" --merge-output-format mp4 --sleep-requests 1 --concurrent-fragments 1 --external-downloader aria2c --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 2M --file-allocation=none" $argv
  yt-dlp \
  --user-agent "com.google.android.youtube/18.11.34 (Linux; U; Android 11)" \
  --add-header "Accept-Language: en-US,en;q=0.9" \
  # --extractor-args "youtube:player_client=tv" \
  --sleep-requests 1 \
  # -f "(bv*[height=1080]/bv*[height<=1080])[vcodec^=avc]/bv*[height=1080]/bv*[height<=1080]+ba/b" \
  # -f "bv*[vcodec^=avc][height<=1080]/bv*[vcodec^=avc][height<=720]+ba" \
  # -f "bv*[vcodec^=avc][height<=1080]+ba/b[height<=1080]" \
  # -f "bv*[height=1080]/bv*[height<=1080]+ba/b" \
  -o "%(title)s.%(ext)s" \
  --merge-output-format mp4 \
  --concurrent-fragments 1 \
  --external-downloader aria2c \
  --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 2M --file-allocation=none" \
  "$argv"

end
