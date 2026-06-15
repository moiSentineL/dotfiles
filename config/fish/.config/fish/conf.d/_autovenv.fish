set -U AUTOSWITCH_VERSION "3.6.0"
set -U AUTOSWITCH_FILE ".venv"

if status is-interactive
    # erase the variable VIRTUAL_ENV when entering fish to clean up potential leftovers (e.g. when doing exec fish in a virtualenv)
    set -e VIRTUAL_ENV

    function _autovenv_activate_on_cd --on-variable dirprev # PWD get's updated before dirprev so we're listening on dirprev instead to ensure that it is up-to-date
        test -z "$dirprev" && return # dirprev get's set on first cd and then updated; this fires the trigger two times, so we return early
        _autovenv_check_venv
    end
    _autovenv_check_venv
end
