function _autovenv_activate_poetry -d "Activates the virtualenv for the current poetry project directory"
    # check if any environments exist before trying to activate
    # if env list is empty, then no environment exists that can be activated
    set -l name (poetry env list --full-path | sort -k 2 | tail -n 1 | cut -d' ' -f1)
    if test -n "$name"
        _autovenv_maybeworkon "$name" "poetry"
        return 0
    end
    return 1
end
