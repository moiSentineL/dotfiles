if status is-interactive
    # Commands to run in interactive sessions can go here
end

# prompt
starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/nibir/.ghcup/bin $PATH # ghcup-env
# pnpm
set -gx PNPM_HOME "/home/nibir/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
