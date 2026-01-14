function yt --description 'download youtube stuff using aria2c'
  yt-dlp -f "bv*[vcodec=h264]+ba / bv+ba" --merge-output-format mp4 --concurrent-fragments 8 --external-downloader aria2c --external-downloader-args "aria2c:-c -j 4 -x 16 -s 16 -k 5M --file-allocation=none" $argv
end
