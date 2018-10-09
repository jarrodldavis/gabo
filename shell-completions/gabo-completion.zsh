#compdef gabo
#
# Zsh completion for gabo
#
# INSTALLATION
#
# First install gabo from
# https://github.com/jarrodldavis/gabo
#
# Make sure autocompletion is enabled in your shell, typically
# by adding this to your .zshrc:
#
#     autoload -U compinit && compinit
#
# Then copy this file somewhere (e.g. ~/.zsh/_gabo) and put the
# following in your .zshrc:
#
#     fpath=(~/.zsh $fpath)
#
#
# CONTRIBUTING
#
# See https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org 
# for tips on writing and testing zsh completion functions.
#
# CREDITS
#
# Written by Simon Whitaker <sw@netcetera.org>

_gabo_commands()
{
    _gabo_commands=(
        'dump:Dump one or more boilerplates' \
        'list:List available boilerplates' \
        'update:Update list of available boilerplates' \
        'help:Display this help text' \
        'version:Display current script version'
    )
    _describe 'command' _gabo_commands
}

_gabo_dump_commands()
{
    local local_repo=${GABO_BOILERPLATES:-"$HOME/.gitattributes-boilerplates"}
    local -a boilerplates
    if [ -e "$local_repo" ]; then
        boilerplates=($local_repo/**/*.gitattributes(:r:t))
    fi

    _arguments "*:boilerplate:($boilerplates)"
}

_gabo()
{
    local ret=1

    _arguments -C \
        '1: :_gabo_commands' \
        '*::arg:->args' \
        && ret=0

    case $state in
        args )
            case $line[1] in
                dump )
                    _arguments \
                        '*: :_gabo_dump_commands' \
                        && ret=0
                    ;;
            esac
    esac
}
