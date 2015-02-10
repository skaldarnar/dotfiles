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
# located in your dotfiles repository. Be aware of the few naming conventions:
#
#   <tag>/path.zsh        - is loaded first and is expected to set $PATH or similar
#   <tag>/completion.zsh  - is loaded last and is expected to setup autocomplete
#   <tag>/*.zsh           - any other zsh files get loaded into your environment
#
# ░░░░░░▒▒▒▒▓▓▓▓▓████

# Shortcut to the root of the dotfiles folder.
export ZSH=$HOME/.dotfiles

# Put your environment variables in `~/.localrc`. That way they'll stay of your
# main dotfiles repository (which may be public, like this one), but you'll still
# have access to it in your scripts.
[[ -a $HOME/.localrc ]] && source $HOME/.localrc

# Collect all your zsh config, path, and completion files from the tag directories
typeset -U zshs
zshs=( $ZSH/tag-*/*.zsh )

path_files=( ${(M)zshs:#*/path.zsh} )                     # find all `path.zsh`
comp_files=( ${(M)zshs:#*/completion.zsh} )               # find all `completion.zsh`
conf_files=( ${${zshs:#*/path.zsh}:#*/completion.zsh} )   # filter out `path.zsh` and `completion.zsh`

# Load the path files (named 'path.zsh')
for file in $path_files
do
  source $file
done

# Initialize autocomplete here, otherwise functions won't be loaded.
autoload -U compinit
compinit

# Load any other configuration files (named '*.zsh')
for file in $conf_files
do
  source $file
done

# Load the completions files (named 'completion.zsh')
for file in $comp_files
do
  source $file
done

unset zshs path_files comp_files conf_files
