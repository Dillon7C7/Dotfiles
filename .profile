# .bash_profile

# Get bash aliases and functions
[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/.local/bin" ]; then
	case ":${PATH}:" in
		*":${HOME}/.local/bin:"*) : ;;
		*) PATH="${HOME}/.local/bin:${PATH}" ;;
	esac
fi

# Default programs:
export EDITOR="vim"
export TERMINAL="alacritty"

# User specific environment and startup programs

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
export PASSWORD_STORE_DIR="${XDG_CONFIG_HOME}/pass/password-store"

# BAD/TEMP PLACE FOR THESE...?
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

#  if ssh needs a passphrase, it will read from current terminal
#+ otherwise, it will execute the program specified by SSH_ASKPASS
#+ and open an X11 window to read the passphrase
export SSH_ASKPASS=/usr/libexec/openssh/ssh-askpass

if command -v keychain >/dev/null 2>&1; then
	eval "$(keychain --quiet --eval id_rsa)"
fi
