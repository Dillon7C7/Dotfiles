# .bash_profile

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/.local/bin" ]; then
	case ":${PATH}:" in
		*":${HOME}/.local/bin:"*) : ;;
		*) export PATH="${HOME}/.local/bin:${PATH}" ;;
	esac
fi

# Default programs:
export EDITOR="vim"
export TERM="xterm-256color"
export TERMINAL="xterm-256color"

# XDG Base Directory specification user directories:
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Software with partial XDG Base Directory specification support:
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export BASH_COMPLETION_USER_FILE="${XDG_CONFIG_HOME}/bash-completion/bash_completion"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export FFMPEG_DATADIR="${XDG_CONFIG_HOME}/ffmpeg"
export LESSHISTFILE="${XDG_STATE_HOME}/lesshst"
export PASSWORD_STORE_DIR="${XDG_CONFIG_HOME}/pass/password-store"
export PYTHON_HISTORY="${XDG_STATE_HOME}/python/history"
export SCREENDIR="${XDG_RUNTIME_DIR}/screen"
export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
export TMUX_TMPDIR="${XDG_RUNTIME_DIR}"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export VAGRANT_ALIASES_FILE="${XDG_DATA_HOME}/vagrant/aliases"
#export XINITRC="${XDG_CONFIG_HOME}/x11/xinitrc"
#export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# BAD/TEMP PLACE FOR THESE...?
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

#  if ssh needs a passphrase, it will read from current terminal
#+ otherwise, it will execute the program specified by SSH_ASKPASS
#+ and open an X11 window to read the passphrase
export SSH_ASKPASS=/usr/libexec/openssh/ssh-askpass

if command -v keychain >/dev/null 2>&1; then
	eval "$(keychain --absolute --dir "${XDG_RUNTIME_DIR}/keychain" --quiet --eval id_rsa)"
fi

# Get bash aliases and functions
[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
