#!/bin/bash

#
#   ██                    ██              ██  ██
#  ░░                    ░██             ░██ ░██
#   ██ ███████   ██████ ██████  ██████   ░██ ░██
#  ░██░░██░░░██ ██░░░░ ░░░██░  ░░░░░░██  ░██ ░██
#  ░██ ░██  ░██░░█████   ░██    ███████  ░██ ░██
#  ░██ ░██  ░██ ░░░░░██  ░██   ██░░░░██  ░██ ░██
#  ░██ ███  ░██ ██████   ░░██ ░░████████ ███ ███
#  ░░ ░░░   ░░ ░░░░░░     ░░   ░░░░░░░░ ░░░ ░░░
#
# ████▓▓▓▓▓▒▒▒▒░░░░░░
#
# This script will install (symlink) the dotfiles to your home directory using a mix of
# various tools.
#
# First, all files named `*.symlink` located at the root of the dotfiles directory are
# symlinked as
#
# ░░░░░░▒▒▒▒▓▓▓▓▓████

DOTFILES_ROOT="$(pwd)"
set -e

info () {
  printf " [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2
  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then
        skip=true;
      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
              [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ] # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_symlinks () {
  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$DOTFILES_ROOT/" -maxdepth 1 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_tags () {
  for tag in $(find "$DOTFILES_ROOT/" -maxdepth 1 -type d -name 'tag-*')
  do
    stow -v -S $(basename "$tag")    
    success "Linking $(basename "$tag") done."
  done
}

install_tags

echo ''
echo ' All installed!'
