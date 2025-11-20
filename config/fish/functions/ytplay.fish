function ytplay
    if test -z "$argv[1]"; and test -z "$argv[2]"
        echo "no args lol"
    else 
        switch $argv[1]
            case video
                mpv $argv[2] &
            case music
                mpv --ytdl-format=251 $argv[2]
            case '*'
                echo "what?"
        end
    end
end

