function darkpdf
    set currentdir = $(pwd)
    cd /home/nibir/.local/repos/darkpdf/
    if test -n $argv
        python converter.py "$currentdir/$argv"
    else
        echo "no arg sir"
    end
    cd $currentdir
end
