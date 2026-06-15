function _autovenv_get_venv_name -d "Returns the name of the virtualenv for the given directory and type"
    set -l venv_dir "$argv[1]"
    set -l venv_type "$argv[2]"
    set -l venv_name (basename "$venv_dir")

    # clear pipenv from the extra identifiers at the end
    if test "$venv_type" = "pipenv"
        set venv_name (string split -f1 -m1 -r "-" "$venv_name")
    end

    printf "%s" "$venv_name"
end
