function _autovenv_check_permissions -d "Checks if the given path is owned by the current and the permissions are matching [64][04][04]"
    set -l check_path "$argv[1]"
    set -l file_owner
    set -l file_permissions

    /usr/bin/stat --version &> /dev/null
    if test $status -eq 0 # Linux, or GNU stat
        set file_owner (/usr/bin/stat -c %u "$check_path")
        set file_permissions (/usr/bin/stat -c %a "$check_path")
    else                  # macOS, or FreeBSD stat
        set file_owner (/usr/bin/stat -f %u "$check_path")
        set file_permissions (/usr/bin/stat -f %OLp "$check_path")
    end

    if test -f "$check_path" && test "$file_owner" != (id -u)
        printf "AUTOSWITCH WARNING: Virtualenv will not be activated\n\n"
        printf "Reason: Found a $AUTOSWITCH_FILE file but it is not owned by the current user\n"
        printf "Change ownership of %s to %s to fix this\n" (set_color magenta)"$check_path"(set_color normal) (set_color magenta)"'$USER'"(set_color normal)
        return 1
    else if test -f "$check_path" && ! string match -rq '^[64][04][04]$' $file_permissions
        printf "AUTOSWITCH WARNING: Virtualenv will not be activated\n\n"
        printf "Reason: Found a $AUTOSWITCH_FILE file with weak permission settings ($file_permissions).\n"
        printf "Run the following command to fix this: %s\n" (set_color magenta)"chmod 600 $check_path"(set_color normal)
        return 1
    end
end
