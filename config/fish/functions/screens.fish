function screens
    if test -z "$argv[1]"
        echo "no args lol"
    else 
        switch $argv[1]
            case extend
                xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1921x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off
            case dupe
                xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP
            case '*'
                echo "what?"
        end
    end
end

