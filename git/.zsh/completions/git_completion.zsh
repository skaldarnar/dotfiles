# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where it is
# located in an ArchLinux installation, at least).

# ArchLinux
completion='/usr/share/git/completion/git-completion.zsh'

# Homebrew
#completioin='$(brew --prefix)/share/zsh/site-functions/_git'

[[ -f $completion ]] && fpath=( $completion $fpath )
