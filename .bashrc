[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# https://news.ycombinator.com/item?id=11070797
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

export TERM=xterm-256color

export VISUAL=vim
export EDITOR="$VISUAL"

GREP_OPTIONS="--color=always"
alias grep="grep $GREP_OPTIONS"

export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# http://www.biostat.jhsph.edu/~afisher/ComputingClub/webfiles/KasperHansenPres/IntermediateUnix.pdf
# https://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist

# Auto-complete command from history
# http://lindesk.com/2009/04/customize-terminal-configuration-setting-bash-cli-power-user/
export INPUTRC=~/.inputrc

set -o emacs

# http://superuser.com/questions/384769/alias-rm-rm-i-considered-harmful
alias rmi='rm -i'

function color_my_prompt {
    local __time="\[\033[01;32m\]\D{%H:%M}"
    local __user_and_host="\[\033[01;34m\]@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__time $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
    alias ls='ls -G'
fi

alias ll='ls -la'
alias l.='ls -d .*'

# colored man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
