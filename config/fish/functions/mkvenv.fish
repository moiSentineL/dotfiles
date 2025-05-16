function mkvenv -d "create a virtualenv for the current directory"
    set -l venv_type (_autovenv_get_venv_type "$PWD")
    # Copy parameters variable so that we can mutate it
    # NOTE: Keep declaration of variable and assignment separate, so no empty parameters are passed to commands
    set -l params
    test -n "$argv" && set params $argv

    if test "$venv_type" = "pipenv" && _autovenv_command_available "pipenv"
        # TODO: detect if this is already installed
        pipenv install --dev $params
        _autovenv_activate_pipenv
        return
    else if test "$venv_type" = "poetry" && _autovenv_command_available "poetry"
        # TODO: detect if this is already installed
        poetry install $params
        _autovenv_activate_poetry
        return
    else if _autovenv_command_available "virtualenv"
        if test -f "$AUTOSWITCH_FILE"
            printf "$AUTOSWITCH_FILE file already exists. If this is a mistake use the rmvenv command\n"
        else
            set -l venv_name "$(basename $PWD)-$(_autovenv_randstr)"

            printf "Creating virtualenv %s\n" (set_color magenta)"$venv_name"(set_color normal)

            if test -n "$AUTOSWITCH_DEFAULT_PYTHON" && ! string match -q -- "*--python*" "$params"
                printf "Using default python %s\n" (set_color magenta)"$AUTOSWITCH_DEFAULT_PYTHON"(set_color normal)
                set -a params "--python=$AUTOSWITCH_DEFAULT_PYTHON"
            end

            if string match -q -- "*--verbose*" "$params"
                virtualenv $params (_autovenv_get_venv_dir "$venv_name")
            else
                virtualenv $params (_autovenv_get_venv_dir "$venv_name") > /dev/null
            end

            printf "$venv_name\n" > "$AUTOSWITCH_FILE"
            chmod 600 "$AUTOSWITCH_FILE"

            _autovenv_maybeworkon (_autovenv_get_venv_dir "$venv_name") "virtualenv"

            _autovenv_install_requirements
        end
    end
end
