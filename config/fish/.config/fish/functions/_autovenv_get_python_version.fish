function _autovenv_get_python_version -d "Returns the version of the given python binary or 'unknown' when it does not exist"
    set -l PYTHON_BIN "$argv[1]"
    if test -f "$PYTHON_BIN"
        # For some reason python --version writes to stderr
        printf "%s" ($PYTHON_BIN --version 2>&1)
    else
        printf "unknown"
    end
end
