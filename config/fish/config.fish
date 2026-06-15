if status is-interactive
    # Commands to run in interactive sessions can go here
end

# prompt
starship init fish | source
zoxide init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/nibir/.ghcup/bin $PATH # ghcup-env
# pnpm
set -gx PNPM_HOME "/home/nibir/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#
# function mindful_enter
#     set -l cmd (commandline)

#     # 1. Immediate pass for empty lines or 'safe' essentials
#     if test -z "$cmd"; or string match -qr '^(ls|cd|pwd|clear|exit|man|math|cat|git status|bind|cmus|rr|ranger|lsblk|st)' -- "$cmd"
#         commandline -f execute
#         return
#     end

#     # 2. Temporarily unbind to prevent infinite recursion
#     bind --erase \r
#     bind --erase \n

#     # 3. The Cognitive Speed Bump
#     echo -e "\n🤔 [MIND-CHECK]: Why are you running '$cmd'?"
#     # Just use 'read' now; it won't trigger this function because we unbound it
#     read -p "echo 'Reason (10+ chars): '" reason

#     # 4. Validation
#     if test (string length -- "$reason") -lt 10
#         echo -e "❌ Reason too vague. Command aborted. Back to the math.\n"
#         commandline ""
#         commandline -f repaint
#     else
#         echo "⏳ 5-second pause to reflect..."
#         sleep 5
#         commandline -f execute
#     end

#     # 5. Restore the bind for the NEXT command
#     bind \r mindful_enter
#     bind \n mindful_enter
# end

# # Initial Bind
# bind \r mindful_enter
# bind \n mindful_enter
