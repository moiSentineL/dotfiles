function _autovenv_get_venv_type -d "Returns the type of virtualenv for the given directory when a matching target file is found"
    set -l venv_dir "$argv[1]"
    set -l venv_type "unknown"
    if test -f "$venv_dir/Pipfile"
        set venv_type "pipenv"
    else if test -f "$venv_dir/poetry.lock"
        set venv_type "poetry"
    else if test -f "$venv_dir/requirements.txt" || test -f "$venv_dir/setup.py"
        set venv_type "virtualenv"
    end
    printf "%s" "$venv_type"
end
