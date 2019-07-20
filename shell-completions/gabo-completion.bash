# Bash completion for gabo
#
# INSTALLATION
#
# First install gabo from
# https://github.com/jarrodldavis/gabo
#
# Then copy this file into a bash_completion.d folder:
#
#     /etc/bash_completion.d
#     /usr/local/etc/bash_completion.d
#     ~/bash_completion.d
#
# or copy it somewhere (e.g. ~/.gabo-completion.bash) and put the
# following in your .bashrc:
#
#     source ~/.gabo-completion.bash
#
# CREDITS
#
# Written by Simon Whitaker <sw@netcetera.org>

_gabo()
{
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"

    case $COMP_CWORD in
        1)
            COMPREPLY=($(compgen -W "dump help list root search update version" -- ${cur}))
            ;;
        *)
            subcommand="${COMP_WORDS[1]}"
            case $subcommand in
                dump)
                    opts=$( find ${GABO_BOILERPLATES:-"$HOME/.gitattributes-boilerplates"} -name "*.gitattributes" -exec basename \{\} .gitattributes \; )
                    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            ;;
    esac
}

complete -F _gabo gabo
