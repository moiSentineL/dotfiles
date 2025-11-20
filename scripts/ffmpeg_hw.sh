ffmpeg -init_hw_device "vulkan=gpu:0.0" -extra_hw_frames 8 \
    -hwaccel_output_format cuda \
    -i "$1" \
    -fps_mode cfr \
    -c:v h264_nvenc \
    -c:s copy \
    -threads auto \
    -y "$2"
    
    #-vf scale=1280x720:flags=lanczos \
    #-cq:v 23 \
    #-c:a copy \
