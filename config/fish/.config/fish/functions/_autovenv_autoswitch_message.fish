function _autovenv_autoswitch_message -d "Prints the given message when AUTOSWITCH_SILENT is not set"
    if test -z "$AUTOSWITCH_SILENT"
        printf $argv
    end
end
