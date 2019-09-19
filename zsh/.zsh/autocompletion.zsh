# autocompletion systems
autoload -Uz compinit
compinit

autoload -U ~/.zsh/completions/*(:t)

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' 	# matches case insensitive for lowercase
zstyle ':completion:*' insert-tab pending 								# pasting with tabs doesn't perform completion
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
