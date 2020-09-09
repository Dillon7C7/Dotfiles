#!/bin/sh

# Make sure to check 'Use system keyboard layout' in IBus Preferences
# This will prevent IBus from overriding Xmodmap settings

current_ime="$(ibus engine)"

case "$current_ime" in
	# English, switch to Chinese
	xkb:us::eng) ibus engine libpinyin ;;
	# Chinese, switch to English
	libpinyin) ibus engine xkb:us::eng ;;
	# Unexpected ibus engine, switch to English
	*) ibus engine xkb:us::eng ;;
esac
