# Fish completion for gabo
#
# INSTALLATION
#
# First install gabo from
# https://github.com/jarrodldavis/gabo
#
# Then copy this file to somewhere in $fish_complete_path,
# e.g. ~/.config/fish/completions
#
# CREDITS
#
# Initial version written by Sebastian Schulz <https://github.com/yilazius>

function __gabo_wants_subcommand
    set cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

function __gabo_using_subcommand
    set cmd (commandline -opc)
    set subcommand $argv[1]
    if test (count $cmd) -ge 2
        and test $cmd[2] = $subcommand
        return 0
    end
    return 1
end

function __gabo_completion_list
    set gabo_home "$HOME/.gitattributes-boilerplates"
    if set -q GABO_BOILERPLATES
        set gabo_home $GABO_BOILERPLATES
    end
    find "$gabo_home" -name "*.gitattributes" -exec basename \{\} .gitattributes \;
end

complete -c gabo -n "__gabo_wants_subcommand" -f -a "dump" -d 'Dump one or more boilerplates to STDOUT'
complete -c gabo -n "__gabo_wants_subcommand" -f -a "help" -d 'Show help information'
complete -c gabo -n "__gabo_wants_subcommand" -f -a "list" -d 'Show the list of available boilerplates'
complete -c gabo -n "__gabo_wants_subcommand" -f -a "update" -d 'Update the list of available boilerplates'
complete -c gabo -n "__gabo_wants_subcommand" -f -a "version" -d 'Show the current version of gabo installed'
complete -c gabo -n "__gabo_using_subcommand dump" -f -a '(__gabo_completion_list)'
