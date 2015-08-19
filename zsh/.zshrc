#
#                 ██
#                ░██
#  ██████  ██████░██      ██████  █████
# ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#    ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#   ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██████ ██████ ░██  ░██░███   ░░█████
# ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░
#
#
# ████▓▓▓▓▓▒▒▒▒░░░░░░
#
# This configuration file for the zsh will automatically source all `*.zsh` files
# located in the `.zsh/` directory.
#
# ░░░░░░▒▒▒▒▓▓▓▓▓████

# Shortcut to the root of the zsh configuration files.
export ZSH=$HOME/.zsh

# Put your environment variables in `~/.localrc`. That way they'll stay of your
# main dotfiles repository (which may be public, like this one), but you'll still
# have access to it in your scripts.
[[ -a $HOME/.localrc ]] && source $HOME/.localrc

# Load configs
for config ($ZSH/*.zsh) source $config

