function vidtopod
    ffmpeg -i "$argv[1]" -vn -c:a copy "$argv[2]"
end
