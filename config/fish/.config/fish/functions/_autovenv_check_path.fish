function _autovenv_check_path -d "Returns the path to the nearest target file"
    set -l check_dir "$argv[1]"

    if test -e "$check_dir/$AUTOSWITCH_FILE"
        printf "$check_dir/$AUTOSWITCH_FILE"
        return
    else if test -f "$check_dir/poetry.lock"
        printf "$check_dir/poetry.lock"
        return
    else if test -f "$check_dir/Pipfile"
        printf "$check_dir/Pipfile"
        return
    else
        # Abort search at file system root or HOME directory (latter is a performance optimisation).
        if test "$check_dir" = "/" || test "$check_dir" = "$HOME" || test "$check_dir" = "."
            return
        end
        _autovenv_check_path (dirname "$check_dir")
    end
end
