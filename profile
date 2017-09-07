# ~/.profile: executed by command interpreter for login shells
# Not read by bash if bash_login or bash_profile exists

# if running bash
if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi
