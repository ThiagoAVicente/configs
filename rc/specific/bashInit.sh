eval "$(starship init bash)"

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /usr/share/bash-preexec/bash-preexec.sh ]; then
    . /usr/share/bash-preexec/bash-preexec.sh
fi

if [ -f ~/.config/bash-syntax-highlighting/highlighting.sh ]; then
    . ~/.config/bash-syntax-highlighting/highlighting.sh
fi

preexec() {
    highlight_command "$1"
}
eval "$(jump shell)"
export PATH="$PATH:/home/vcnt/.local/zed.app/bin"
eval "$(direnv hook bash)"

export GTK_THEME=Adwaita:dark

