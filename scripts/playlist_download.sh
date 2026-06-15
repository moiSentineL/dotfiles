yt-dlp "$1" \
  --external-downloader=aria2c \
  --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 2M --file-allocation=none" \
  --playlist-items $2-$3 \
  -o "%(playlist_index)s - %(title)s.%(ext)s" \
  --download-archive archive.txt \
  --write-auto-sub \
  --embed-subs \
  --embed-chapters \
  --sub-lang en \
  --merge-output-format mp4 \
  -f "bestvideo[vcodec!*=av01][vcodec!*=vp9][vcodec!*=vp09]+bestaudio[ext=opus]/bestvideo[vcodec!*=av01][vcodec!*=vp9]+bestaudio/bestvideo+bestaudio" \
  --continue \
  --no-overwrites \
  --concurrent-fragments 5 \
  --http-chunk-size 10M

