function __get_ids
  seq -f "@%g" 1 "$( timew get dom.tracked.count )"
end

function __get_tags
  timew tags | awk '{if(NR>3)print $1}'
end

function __get_extensions
  timew extensions | awk '{if(NR>6)print $1}'
end

set -l timew_commands "annotate cancel config continue day delete diagnostics end export extensions fill gaps get help join lengthen modify month move report resize shorten show split start stop summary tag tags track undo untag week"

# first layer
complete -f -c timew -n "not __fish_seen_subcommand_from $timew_commands" -a $timew_commands

# ids
complete -f -c timew -n "__fish_seen_subcommand_from modify tag untag; and not __fish_seen_subcommand_from (__get_ids)" -a "(__get_ids)"

# tags for start/track
complete -f -c timew -n "__fish_seen_subcommand_from start track" -a "(__get_tags)"

