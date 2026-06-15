function _autovenv_check_venv -d "Checks the current directory for a potential virtualenv and when found tries to activate it"
    set -q AUTOSWITCH_DISABLE && return

    set -l file_owner
    set -l file_permissions

    # Get the $AUTOSWITCH_FILE, scanning parent directories
    set -l venv_path (_autovenv_check_path $PWD)

    if test -n "$venv_path" && _autovenv_check_permissions $venv_path
        if string match -rq ".*/Pipfile" "$venv_path"
            if type "pipenv" > /dev/null && _autovenv_activate_pipenv
                return
            end
        else if string match -rq ".*/poetry.lock" "$venv_path"
            if type "poetry" > /dev/null && _autovenv_activate_poetry
                return
            end
        # standard use case: $venv_path is a file containing a virtualenv name
        else if test -f "$venv_path"
            read -l switch_to < "$venv_path"
            _autovenv_maybeworkon (_autovenv_get_venv_dir "$switch_to") "virtualenv"
            return
        # $venv_path actually is itself a virtualenv
        else if test -d "$venv_path" && test -f "$venv_path/bin/activate"
            _autovenv_maybeworkon "$venv_path" "virtualenv"
            return
        end
    end
    # If we still haven't got anywhere, fallback to defaults
    _autovenv_activate_default_venv

    set -l venv_type (_autovenv_get_venv_type "$PWD")
    if test "$venv_type" != "unknown"
        printf "Python %s project detected. " (set_color magenta)"$venv_type"(set_color normal)
        printf "Run %s to setup the environment.\n" (set_color magenta)"mkvenv"(set_color normal)
    end
end
