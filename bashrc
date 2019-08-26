# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
