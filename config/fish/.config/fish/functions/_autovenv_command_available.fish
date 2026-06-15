function _autovenv_command_available -d "Prints a warning message when the given command is not available"
    set -l command "$argv[1]"
    if ! type -q "$command"
        set_color red
        printf "fish-autoswitch-virtualenv requires '%s' to install this project!\n\n" "$command"
        set_color normal
        printf "If this is already installed but you are still seeing this message, \n"
        printf "then make sure the %s command is in your PATH.\n" (set_color red)"$command"(set_color normal)
        printf "\n"
        return 1
    end
end
