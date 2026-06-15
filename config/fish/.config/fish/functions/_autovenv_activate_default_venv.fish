function _autovenv_activate_default_venv -d "Activates AUTOSWITCH_DEFAULTENV when set or else it deactivates the current environment"
    if test -n "$AUTOSWITCH_DEFAULTENV"
        _autovenv_maybeworkon (_autovenv_get_venv_dir "$AUTOSWITCH_DEFAULTENV") "virtualenv"
    else if test -n "$VIRTUAL_ENV"
        set -l venv_type (_autovenv_get_venv_type "$dirprev[-1]")
        set -l venv_name (_autovenv_get_venv_name "$VIRTUAL_ENV" "$venv_type")
        _autovenv_autoswitch_message "Deactivating %s %s\n" $venv_type (set_color magenta)"$venv_name"(set_color normal)
        _autovenv_deactivate_virtualenv
    end
end
