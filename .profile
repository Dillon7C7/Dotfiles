# .bash_profile

# Get the aliases and functions
[ -f ~/.bashrc ] && . ~/.bashrc

export EDITOR="vim"
export TERMINAL="gnome-terminal"

# User specific environment and startup programs

# BAD/TEMP PLACE FOR THESE...?
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

#  if ssh needs a passphrase, it will read from current terminal
#+ otherwise, it will execute the program specified by SSH_ASKPASS
#+ and open an X11 window to read the passphrase
export SSH_ASKPASS=/usr/libexec/openssh/ssh-askpass

if command -v keychain 2>&1 >/dev/null; then
	eval "$(keychain --quiet --eval id_rsa)"
fi
