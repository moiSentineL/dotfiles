function _autovenv_activate_pipenv -d "Activates the pipenv for the current directory"
    if set venv_path (set -x PIPENV_IGNORE_VIRTUALENVS 1; pipenv --venv 2>/dev/null)
        _autovenv_maybeworkon "$venv_path" "pipenv"
        return 0
    end
    return 1
end
