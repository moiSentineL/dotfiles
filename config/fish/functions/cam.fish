function cam --wraps='scrcpy --video-source=camera --camera-facing=front --no-audio --max-fps=30 --camera-size=1920x1080 --v4l2-sink=/dev/video10 --no-video-playback' --description 'alias cam=scrcpy --video-source=camera --camera-facing=front --no-audio --max-fps=30 --camera-size=1920x1080 --v4l2-sink=/dev/video10 --no-video-playback'
    scrcpy --video-source=camera --camera-facing=front --no-audio --max-fps=30 --camera-size=1920x1080 --v4l2-sink=/dev/video10 --no-video-playback $argv
end
