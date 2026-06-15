function _autovenv_get_venv_dir -d "Returns the path to the virtualenv for the given name"
    set -l venv_name "$argv[1]"
    set -l VIRTUAL_ENV_DIR "$HOME/.virtualenvs"
    test -n "$AUTOSWITCH_VIRTUAL_ENV_DIR" && set VIRTUAL_ENV_DIR $AUTOSWITCH_VIRTUAL_ENV_DIR
    printf "%s/%s" "$VIRTUAL_ENV_DIR" "$venv_name"
end
