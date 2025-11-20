yt-dlp "$1" \
  --external-downloader=aria2c \
  --external-downloader-args '--min-split-size=1M --max-connection-per-server=16 --max-concurrent-downloads=16 --split=16' \
  --playlist-items $2-$3 \
  -o "%(title)s.%(ext)s" \
  --download-archive archive.txt \
  --write-auto-sub \
  --embed-subs \
  --embed-chapters \
  --sub-lang en \
  --merge-output-format mp4 \
  --format "137+140/bestvideo+bestaudio" \
  --continue \
  --no-overwrites \
  --concurrent-fragments 5 \
  --http-chunk-size 10M

