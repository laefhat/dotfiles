# set xdg base directories, just in case
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# ensures programs handle text and characters in a consistent
# unicode-friendly way
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# nvim as default editor for command-line/visual editor
export EDITOR='nvim'
export VISUAL='nvim'
# preserves a long command history
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
# indicates support for 24-bit true color
export TERM=tmux-256color
export COLORTERM=truecolor
# ensures go tools are accessible from the command line
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
