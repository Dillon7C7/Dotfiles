# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# set primary prompt string
export PS1="[\u@\h \w]\\$ "

# History format: "abbr. month name, day of month, hour,minute,second"
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# Command history size
export HISTSIZE=20000

# Maximum lines in $HISTFILE
export HISTFILESIZE=25000

# Append each command to $HISTFILE rather than overwrite
shopt -s histappend

## Save each command right after it has been executed, instead of on exit
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a"

# Source bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
