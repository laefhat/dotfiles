# allows you to just type a directory name to cd into it
# don't use this often, but leave it here for convenience
setopt auto_cd
# loads and initializes advanced zsh tab-completion features
autoload -Uz compinit; compinit
# enable and config history
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
# prevent ctrl-d (eof) from closing the shell (must type `exit`)
# this conflicts with scrolling in tmux copy-mode-vi
setopt IGNORE_EOF
# use emacs-style keybindings, better in shell not editing
bindkey -e
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# compatible with what alacritty is sending
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word
# display git status info without plugin
source ~/.zsh/plugins/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM='verbose'
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_COMPRESSSPARSESTATE=true
# allows variable and command substitution in prompt
setopt PROMPT_SUBST
PS1='%B%F{magenta}%0~%f%b% %F{blue}$(__git_ps1 " [%s]") %f%(?..%F{red})%(!.#.$)%f%b '
# load auto-suggestions manually
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# use nvim as vim locally
alias vim=nvim
# load settings and env vars that don't need to backup
source $HOME/.profile
