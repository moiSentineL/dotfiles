function _autovenv_validated_source -d "Validates the target path for invalid characters and sources it when valid"
    set -l target_path "$argv[1]"

    if string match -q "*..*" "$target_path"
        printf "AUTOSWITCH WARNING: " >&2
        printf "target virtualenv contains invalid characters\n" >&2
        printf "virtualenv activation cancelled\n" >&2
        return
    else
        source "$target_path"
    end
end
