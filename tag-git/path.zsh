# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where it is
# located in an ArchLinux installation, at least).
completion='/usr/share/git/completion/git-completion.zsh'

[[ -f $completion ]] && fpath=( $completion $fpath )
