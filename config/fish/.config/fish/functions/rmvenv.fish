
function rmvenv -d "remove the virtualenv for current directory"
    ! type -q rmvenv_rm && function rmvenv_rm # only create if the function does not exist; allows us to mock it in the tests
        # Using explicit paths to avoid any alias/function interference.
        # rm should always be found in this location according to
        # https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html
        # https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
        /bin/rm $argv
    end

    set -l venv_type (_autovenv_get_venv_type "$PWD")

    if test "$venv_type" = "pipenv"
        _autovenv_deactivate_virtualenv
        pipenv --rm
    else if test "$venv_type" = "poetry"
        _autovenv_deactivate_virtualenv
        poetry env remove (poetry run which python)
    else
        if test -f "$AUTOSWITCH_FILE"
            read -l venv_name < $AUTOSWITCH_FILE

            # detect if we need to switch virtualenv first
            if test -n "$VIRTUAL_ENV"
                set -l current_venv (basename $VIRTUAL_ENV)
                if test "$current_venv" = "$venv_name"
                    _autovenv_activate_default_venv
                end
            end

            printf "Removing %s\n" (set_color magenta)"$venv_name"(set_color normal)
            rmvenv_rm -rf (_autovenv_get_venv_dir "$venv_name")
            rmvenv_rm "$AUTOSWITCH_FILE"
        else
            printf "No $AUTOSWITCH_FILE file in the current directory!\n"
        end
    end
end
