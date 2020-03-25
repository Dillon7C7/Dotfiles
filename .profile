# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export EDITOR="vim"
export TERMINAL="gnome-terminal"

# User specific environment and startup programs

# BAD/TEMP PLACE FOR THESE
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

eval "$(keychain --quiet --eval id_rsa)"
