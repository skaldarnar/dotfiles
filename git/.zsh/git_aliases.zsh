# Use `hub` as git wrapper if present:
#   http://defunkt.github.com/hub
hub_path=$(which hub)
if (( $+commands[hub] )); then
  alias git=$hub_path
fi

# Some fun git aliases - shorten all the things!
alias gits='git status -sb'

alias gtr='git tree '
alias ghst='git hist '
alias gcfd='git clean -fd'
