[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# https://news.ycombinator.com/item?id=11070797
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

export TERM=xterm-256color

export VISUAL=vim
export EDITOR="$VISUAL"

export GREP_OPTIONS="--color=always"

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
    local __time="\[\033[01;32m\]\D{%H:%M}"\
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__time $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

alias ls="ls -G"
