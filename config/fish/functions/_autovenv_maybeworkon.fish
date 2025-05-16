function _autovenv_maybeworkon -d "Tries to activate the virtualenv for the given directory and type"
    set -l venv_dir "$argv[1]"
    set -l venv_type "$argv[2]"
    set -l venv_name "$(_autovenv_get_venv_name $venv_dir $venv_type)"

    set -l DEFAULT_MESSAGE_FORMAT "Switching %s %s %s\n" "%venv_type" (set_color magenta)"%venv_name"(set_color normal) (set_color green)"[%py_version]"(set_color normal)

    # Don't reactivate an already activated virtual environment
    if test -z "$VIRTUAL_ENV" || test "$venv_name" != "$(_autovenv_get_venv_name $VIRTUAL_ENV $venv_type)"
        if ! test -d "$venv_dir"
            printf "Unable to find %s virtualenv\n" (set_color magenta)"$venv_name"(set_color normal)
            printf "If the issue persists run %s in this directory\n" (set_color magenta)"rmvenv\ &&\ mkvenv"(set_color normal)
            return
        end

        set -l py_version "$(_autovenv_get_python_version "$venv_dir/bin/python")"

        set -l message $DEFAULT_MESSAGE_FORMAT
        set -q AUTOSWITCH_MESSAGE_FORMAT && set message $AUTOSWITCH_MESSAGE_FORMAT
        set message (string replace "%venv_type" $venv_type $message)
        set message (string replace "%venv_name" $venv_name $message)
        set message (string replace "%py_version" $py_version $message)
        _autovenv_autoswitch_message $message

        # If we are using pipenv and activate its virtual environment - turn down its verbosity
        # to prevent users seeing " Pipenv found itself running within a virtual environment" warning
        if test "$venv_type" = "pipenv" && test "$PIPENV_VERBOSITY" != -1
            set -x PIPENV_VERBOSITY -1
        end

        # Much faster to source the activate file directly rather than use the `workon` command
        set -l activate_script "$venv_dir/bin/activate.fish"

        _autovenv_validated_source "$activate_script"
    end
end
