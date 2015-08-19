# explicitly add the `functions` directory to $fpath
#fpath=($ZSH/functions $fpath)
fpath=($HOME/.zsh/functions $fpath)

[ "$(ls -A $HOME/.zsh/functions/)" ] && autoload -U $HOME/.zsh/functions/*(:t)
