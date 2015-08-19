# Use `hub` as git wrapper if present:
#   http://defunkt.github.com/hub
hub_path=$(which hub)
if (( $+commands[hub] )); then
  alias git=$hub_path
fi

# Some fun git aliases - shorten all the things!
alias gco='git checkout'
alias gits='git status -sb'
