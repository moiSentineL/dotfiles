function _autovenv_deactivate_virtualenv -d "Deactivates the active environment; does nothing when no environment is active"
    ! type -q deactivate && return
    deactivate
end
