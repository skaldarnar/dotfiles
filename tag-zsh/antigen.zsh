# Load Antigen as plug-in manager for ZSH
#   https://github.com/zsh-users/antigen

ANTIGEN_ZSH="$ZSH/antigen/antigen.zsh"

if [[ -a $ANTIGEN_ZSH ]]; then
  source $ANTIGEN_ZSH

  antigen use oh-my-zsh

  antigen bundle archlinux
  antigen bundle common-aliases
  antigen bundle git
  antigen bundle git-extras
  antigen bundle gradle
  antigen bundle mvn
  antigen bundle pj             # remember to set `$PROJECT_PATHS`
  antigen bundle sbt
  antigen bundle scala
  #antigen bundle ssh-agent
  antigen bundle sudo
  antigen bundle systemd

  antigen bundle zsh-users/zsh-completions src
  antigen bundle zsh-users/zsh-syntax-highlighting
fi
